import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';

abstract class IAuthanticationDataSource {
  Future<void> register(
      String username, String password, String passwordConfirm, String email);
}

class AuthenticationRemote implements IAuthanticationDataSource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(String username, String password,
      String passwordConfirm, String email) async {
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
