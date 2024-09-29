class Ads {
  int? id;
  String? title;
  String? imageUrl;
  String? link;
  bool? active;
  String? createdAt;
  String? updatedAt;
  Ads(
      {this.id,
      this.title,
      this.imageUrl,
      this.link,
      this.active,
      this.createdAt,
      this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['image_url'];
    link = json['link'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ads = Map<String, dynamic>();
    ads['id'] = id;
    ads['title'] = title;
    ads['image_url'] = imageUrl;
    ads['link'] = link;
    ads['active'] = active;
    ads['created_at'] = createdAt;
    ads['updated_at'] = updatedAt;
    return ads;
  }
}
