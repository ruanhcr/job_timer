import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dart_week/app/entities/project_status.dart';
import 'package:dart_week/app/services/projects/project_service.dart';
import 'package:dart_week/app/view_models/project_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  final ProjectService _projectService;

  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: [],
      );
      await _projectService.register(project);
      emit(ProjectRegisterStatus.succes);
    } catch (e, s) {
      log('Erro ao salvar projeto', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
    }
  }
}
