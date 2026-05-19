/// A single image belonging to a project member.
class MemberImageModel {
  const MemberImageModel({
    required this.path,
    required this.title,
    this.description,
    this.designer,
  });

  final String path;
  final String title;
  final String? description;
  final String? designer;
}

/// Data model for a project team member.
class MemberModel {
  const MemberModel({
    required this.name,
    required this.projectName,
    required this.images,
    this.panoramaPath,
  });

  final String name;
  final String projectName;
  final List<MemberImageModel> images;
  final String? panoramaPath;
}
