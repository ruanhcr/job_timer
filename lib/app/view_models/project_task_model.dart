// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_week/app/entities/project_task.dart';

class ProjectTaskModel {
  int? id;
  String name;
  int duration;
  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask task){
    return ProjectTaskModel(
      id: task.id,
      name: task.name, 
      duration: task.duration
      );
  }
}
