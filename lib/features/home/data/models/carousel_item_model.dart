/// Data model for a single hero carousel slide.
class CarouselItemModel {
  const CarouselItemModel({
    required this.imagePath,
    this.title,
    this.description,
    this.designer,
  });

  final String imagePath;
  final String? title;
  final String? description;
  final String? designer;
}
