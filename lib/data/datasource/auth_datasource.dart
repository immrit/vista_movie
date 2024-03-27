import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

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
        'password': password,
        'passwordConfirm': passwordConfirm,
        'email': email,
      });

      print('${response.statusCode}');
    } on DioException catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknown error');
    }
  }
}
