part 'album.g.dart';

class Album {
  int albumId;

  int id;

  String title;

  String url;

  String thumbnailUrl;

  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
