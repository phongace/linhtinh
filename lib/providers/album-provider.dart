import 'package:flutter/material.dart';
import 'package:time_store/models/album/album.dart';
import 'package:time_store/services/album-services.dart';

class AlbumProvider extends ChangeNotifier {
  List<Album> albums = [];

  Album album;

  Future<List<Album>> getAlbumInfo() async {
    var onValue = await AlbumService.getAlbumInfo();
    albums = onValue;
    notifyListeners();
    return albums;
  }
}
