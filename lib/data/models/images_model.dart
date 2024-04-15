class ImagesModelData {


  List<String?>? images;

  ImagesModelData({
    this.images,
  });
  ImagesModelData.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    return data;
  }
}

class ImagesModel {


  String? status;
  ImagesModelData? data;
  String? message;

  ImagesModel({
    this.status,
    this.data,
    this.message,
  });
  ImagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    data = (json['data'] != null) ? ImagesModelData.fromJson(json['data']) : null;
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}
