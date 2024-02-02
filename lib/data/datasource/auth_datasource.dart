import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';

class AuthenticationRemote {
  final Dio _dio = locator.get();

  Future<void> register(String username, String email, String password,
      String passwordConfirm) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'username': username,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      });

      print('${response.statusCode}');
    } on DioException catch (ex) {
      print(ex.message);
      print(ex.response!.data['message']);
    } catch (ex) {}
  }
}
