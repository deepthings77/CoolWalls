class PhotosModel {
  String imgSrc;
  String photoname;

  PhotosModel({required this.photoname, required this.imgSrc});

  static PhotosModel fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotosModel(
        photoname: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}