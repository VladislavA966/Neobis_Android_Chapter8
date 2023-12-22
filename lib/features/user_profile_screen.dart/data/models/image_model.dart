class ImageModel {
  String? name;
  String? imageUrl;
  String? imageId;

  ImageModel({this.name, this.imageUrl, this.imageId});

  ImageModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['imageId'] = imageId;
    return data;
  }
}
