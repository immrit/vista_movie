import 'package:dartz/dartz.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

import '../datasource/auth_datasource.dart';

class AutunticationRepository {
  final IAuthanticationDataSource _datasource = locator.get();

  Future<Either<String, String>> register() async {
    try {
      await _datasource.register(
          'username', 'password', 'password', 'email@g.co');
      return right('ثبت نام انجام شد!');
    } on ApiExeption catch (e) {
      return left(e.message ?? "خطا محتوا در دسترس نیست");
    }
  }
}
