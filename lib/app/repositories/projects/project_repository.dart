import 'package:dart_week/app/entities/project.dart';
import 'package:dart_week/app/entities/project_status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status);
}
