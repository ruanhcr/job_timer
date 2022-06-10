import 'package:dart_week/app/entities/project_status.dart';
import 'package:dart_week/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:dart_week/app/view_models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProjectDetailAppbar extends SliverAppBar {
  ProjectDetailAppbar({required ProjectModel projectModel, super.key})
      : super(
            expandedHeight: 100,
            pinned: true,
            toolbarHeight: 100,
            title: Text(projectModel.name),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            )),
            flexibleSpace: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 1.6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 2,
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${projectModel.tasks.length} Tasks'),
                            Visibility(
                                visible:
                                    projectModel.status != ProjectStatus.finish,
                                replacement: const Text('Projeto finalizado'),
                                child: _NewTasks(projectModel: projectModel)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
}

class _NewTasks extends StatelessWidget {
  final ProjectModel projectModel;
  const _NewTasks({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed('/project/task/', arguments: projectModel);
        Modular.get<ProjectDetailController>().updateProject();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Text('Adicionar task')
        ],
      ),
    );
  }
}
