import 'category.dart';

class Content {
  int? id;
  String? title;
  String? description;
  String? imagePath;
  int? category;
  int? contentType;
  String? media_url;
  bool? isActive;

  Content(
      {this.id,
      this.title,
      this.description,
      this.imagePath,
      this.category,
      this.contentType,
      this.media_url});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imagePath = json['image_path'];
    category = json['category'];
    contentType = json['contentType'];
    media_url = json['media_url'];
  }
}
