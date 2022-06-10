import 'package:dart_week/app/core/database/database.dart';
import 'package:dart_week/app/core/database/database_impl.dart';
import 'package:dart_week/app/modules/home/home_module.dart';
import 'package:dart_week/app/modules/login/login_module.dart';
import 'package:dart_week/app/modules/project/project_module.dart';
import 'package:dart_week/app/modules/splash/splash_page.dart';
import 'package:dart_week/app/repositories/projects/project_repository.dart';
import 'package:dart_week/app/repositories/projects/project_repository_impl.dart';
import 'package:dart_week/app/services/auth/auth_services.dart';
import 'package:dart_week/app/services/auth/auth_services_impl.dart';
import 'package:dart_week/app/services/projects/project_service.dart';
import 'package:dart_week/app/services/projects/project_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton<Database>((i) => DatabaseImpl()),

    Bind.lazySingleton<ProjectRepository>(
      (i) => ProjectRepositoryImpl(database: i())),
    Bind.lazySingleton<ProjectService>(
      (i) => ProjectServiceImpl(projectRepository: i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/project', module: ProjectModule()),
  ];
}