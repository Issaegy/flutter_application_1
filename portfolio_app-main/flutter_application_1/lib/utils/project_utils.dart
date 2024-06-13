class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? aandroidLink;
  final String? iosLink; //Das mit "String?" sind Links
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.aandroidLink,
    this.iosLink,
    this.webLink,
  });
} 

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: "assets/projects/bildp.png",
    title: "Portfolio",
    subtitle: "Zum hinzufügen zukünftiger Projekte",
    aandroidLink: "",
    webLink: "",
    iosLink: "",
  ),
];
