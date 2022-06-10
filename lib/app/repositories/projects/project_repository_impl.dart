import 'dart:developer';

import 'package:dart_week/app/core/database/database.dart';
import 'package:dart_week/app/core/execptions/failure.dart';
import 'package:dart_week/app/entities/project.dart';
import 'package:dart_week/app/entities/project_status.dart';
import 'package:isar/isar.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar Projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar Projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _database.openConnection();

    final projects =
        await connection.projects.filter().statusEqualTo(status).findAll();

    return projects;
  }
}
