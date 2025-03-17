import 'package:dio/dio.dart';
import 'dart:convert';
import 'http_result.dart';

/// Response 解析
class HttpTransformer extends BackgroundTransformer {
  @override
  Future<String> transformRequest(RequestOptions options) async {
    print("自定义请求数据转换: ${options.data}");
    return super.transformRequest(options);
  }

  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    // 实现自定义的响应体转换逻辑
    print("自定义响应转换");

    String responseData = await super.transformResponse(options, responseBody);
    var jsonData = jsonDecode(responseData);
    print("jsonData：$jsonData");
    if (jsonData is! Map) {
      return BaseResult(code: -1, msg: 'fail');
    }
    return BaseResult(
      data: jsonData['data'],
      code: jsonData['code'],
      msg: jsonData['message'],
    );

    // 这里可以自定义数据结构转换，比如解密数据、修改格式等
    // return jsonData is List ? jsonData.map((e) => e).toList() : jsonData;
    // return super.transformResponse(options, responseBody);
  }
}
