class Content {
  int? code;
  Data? data;
  String? message;

  Content({this.code, this.data, this.message});

  Content.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  Category? category;
  Category? contentType;
  Category? user;
  List<Media>? media;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.contentType,
      this.user,
      this.media,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    contentType = json['content_type'] != null
        ? new Category.fromJson(json['content_type'])
        : null;
    user = json['user'] != null ? new Category.fromJson(json['user']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.contentType != null) {
      data['content_type'] = this.contentType!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Media {
  int? id;
  String? url;

  Media({this.id, this.url});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
