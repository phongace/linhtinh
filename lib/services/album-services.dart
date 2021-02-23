import 'package:dio/dio.dart';
import 'package:time_store/config/constant.dart';
import 'package:time_store/models/album/album.dart';

abstract class AlbumService {
  static Future<List<Album>> getAlbumInfo() async {
    final response = await Dio().get(Constant.apiUrl);
    dynamic listMap = response.data;
    List<dynamic> data = List.from(listMap);
    List<Album> albums = data.map((album) => Album.fromJson(album)).toList();
    return albums;
  }

  static Future<Album> getAlbumById(num id) async {
    final response = await Dio().get(Constant.apiUrl + '/$id');
    dynamic map = response.data;
    Album album = Album.fromJson(map);
    return album;
  }

  static Future<List<Album>> search(String searchTerms) async {
    final response = await Dio().get(Constant.apiUrl);
    dynamic listMap = response.data;
    List<dynamic> data = List.from(listMap);
    List<Album> albums = data.map((album) => Album.fromJson(album)).toList();
    return albums.where((album) {
      return album.title.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }
}
