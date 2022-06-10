enum ProjectStatus {
  in_progress(label: "Em andamento"),
  finish(label: "Finalizado");

  final String label;

  const ProjectStatus({required this.label});
}
