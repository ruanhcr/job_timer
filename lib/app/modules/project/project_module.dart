
import 'package:dart_week/app/modules/project/register/project_register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjectModule extends Module {
  
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/register', module: ProjectRegisterModule()),
  ];
}