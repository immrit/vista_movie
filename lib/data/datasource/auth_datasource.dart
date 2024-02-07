import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

abstract class IAuthanticationDataSource {
  Future<void> register(
      String username, String password, String passwordConfirm, String email);


  Future<String > login( String username , String password );

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
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknown error');
    }
  }


  @override
  Future<String> login(String username, String password) async{


    try{

      var response=   await _dio.post('collections/users/auth-with-password' , data: {
        'identity':username,
        'password':password
      });
      if(response.statusCode==200){
        return response.data?['token'];
      }

    }on DioException catch(ex){
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    }cast(ex){
      throw ApiExeption(0, 'unknown erroe');
    }

    return '';

  }
  }

