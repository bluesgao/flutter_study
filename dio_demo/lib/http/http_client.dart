import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_demo/http/http_transformer.dart';
import 'http_result.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "en";
const String TOKEN = "Bearer token";

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  static Map<String, dynamic> defaultHeaders() {
    // header 头
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: TOKEN,
      DEFAULT_LANGUAGE: DEFAULT_LANGUAGE,
    };
    return headers;
  }

  // 私有构造函数，创建单例
  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl:
            "http://192.168.94.71:4523/m1/6033279-5723072-default", // 你的 API 地址
        //连接服务器超时时间，单位是秒.
        connectTimeout: const Duration(seconds: 5),
        //响应流上前后两次接受到数据的间隔，单位为秒。
        receiveTimeout: const Duration(seconds: 3),
        //Http请求头.
        headers: defaultHeaders(),
      ),
    );

    // 添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("请求: ${options.method} ${options.path}");
          options.headers["Authorization"] = "Bearer your_token"; // 处理 Token
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("HTTP响应码: ${response.statusCode}，HTTP响应体：${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("请求错误: ${e.message}");
          return handler.next(e);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );
    // 使用自定义的Transformer
    // dio.transformer = HttpTransformer();
  }

  // 提供全局访问点
  factory DioClient() => _instance;

  // 通用 GET 请求
  Future<BaseResult<T>> get<T>(
    String path,
    T Function(dynamic) fromJsonT,
  ) async {
    try {
      Response response = await dio.get(path);
      //todo 这里判断http statusCode
      print("get HTTP响应码: ${response.statusCode}，HTTP响应体：${response.data}");
      if (response.statusCode == 200) {
        return BaseResult.fromJson(response.data, fromJsonT);
      } else {
        return BaseResult(code: 9999, msg: "请求错误");
      }
    } catch (e) {
      print("GET 请求错误: $e");
      throw Exception("请求失败");
    }
  }

  // 通用 POST 请求
  Future<BaseResult<T>> post<T>(
    String path,
    dynamic data,
    T Function(dynamic) fromJsonT,
  ) async {
    try {
      Response response = await dio.post(path, data: data);
      return BaseResult.fromJson(response.data, fromJsonT);
    } catch (e) {
      print("POST 请求错误: $e");
      throw Exception("请求失败");
    }
  }
}
