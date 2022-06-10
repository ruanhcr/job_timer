import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dart_week/app/entities/project_status.dart';
import 'package:dart_week/app/services/projects/project_service.dart';
import 'package:dart_week/app/view_models/project_model.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _projectService.findByStatus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch (e, s) {
      log('Erro ao buscar os projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filter(ProjectStatus status) async {
    emit(state.copyWith(status: HomeStatus.loading, projects: []));
    final projects = await _projectService.findByStatus(status);
    emit(state.copyWith(
      status: HomeStatus.complete,
      projects: projects,
      projectFilter: status,
      ),
    );
  }
}
