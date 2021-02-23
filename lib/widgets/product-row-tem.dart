import 'package:flutter/material.dart';
import 'package:time_store/models/album/album.dart';
import 'package:time_store/screens/detail/detail-album.dart';
import 'package:time_store/styles/component.dart';

class AlbumItem extends StatelessWidget {
  final Album album;

  const AlbumItem(this.album);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: CommonStyle.whiteColor,
      elevation: 0,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailAlbum(id: album.id)));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.deepPurple[50]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  '${album.url}',
                  width: 45,
                  height: 45,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  '${album.title}',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
