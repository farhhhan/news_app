class NewsModel {
  String? title;
  String? imageBig;
  String? createdAt;

  NewsModel({
    this.title,
    this.imageBig,
    this.createdAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      imageBig: json['image_big'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['image_big'] = this.imageBig;
    data['created_at'] = this.createdAt;
    return data;
  }
}
