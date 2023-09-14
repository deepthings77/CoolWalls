import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_new/model/category_model.dart';
import 'package:my_new/model/photos_model.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static List<CategoryModel> cateogryModelList = [];

  // static String _apiKey =
  //     "VbW5Mp2PnhfPHZ5tZcSflV1GwgvrVdXKIwYofnV3lhEeN63PxqcsGzfg";
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "VbW5Mp2PnhfPHZ5tZcSflV1GwgvrVdXKIwYofnV3lhEeN63PxqcsGzfg"
    }).then((value) {
      // print("RESPONSE REPORT");
      // print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });

    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "VbW5Mp2PnhfPHZ5tZcSflV1GwgvrVdXKIwYofnV3lhEeN63PxqcsGzfg"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      photos.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });

    return searchWallpapersList;
  }

  static List<CategoryModel> getCategoriesList() {
    List cateogryName = [
      "Krishna",
      "Shiva",
      "Temple",
      "Quotes",
      "Forest",
      "Motivation"
    ];
    cateogryModelList.clear();
    cateogryName.forEach((catName) async {
      final random_ = Random();

      PhotosModel photoModel =
          (await searchWallpapers(catName))[0 + random_.nextInt(11 - 0)];
      // print("IMG SRC IS HERE");
      // print(photoModel.imgSrc);
      cateogryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });

    return cateogryModelList;
  }
}



