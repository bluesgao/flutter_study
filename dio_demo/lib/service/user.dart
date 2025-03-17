import '../http/http_client.dart';
import '../http/http_result.dart';
import '../model/user.dart';

class UserService {
  final DioClient dioClient = DioClient();

  // 获取用户数据
  Future<UserModel?> getUser(String userId) async {
    try {
      BaseResult<UserModel> response = await dioClient.get<UserModel>(
        "/user/${userId}",
        (data) => UserModel.fromJson(data),
      );

      print("请求response: ${response.toString()}");

      if (response.code == 0) {
        return response.data!;
      } else {
        print("API 错误,code:${response.code}, message:${response.msg}");
        return null;
      }
    } catch (e) {
      print("请求失败: $e");
      return null;
    }
  }

  // 获取用户数据
  Future<List<UserModel>?> userList() async {
    try {
      BaseResult<List<UserModel>> response = await dioClient
          .get<List<UserModel>>(
            "/user/list",
            (data) =>
                (data as List).map((json) => UserModel.fromJson(json)).toList(),
          );

      print("请求response: ${response.toString()}");

      if (response.code == 0) {
        return response.data!;
      } else {
        print("API 错误,code:${response.code}, message:${response.msg}");
        return null;
      }
    } catch (e) {
      print("请求失败: $e");
      return null;
    }
  }
}
