import 'package:vista_movie/Di/di.dart';

import '../datasource/auth_datasource.dart';

class AutunticationRepository {
  final IAuthanticationDataSource datasource = locator.get();
}
