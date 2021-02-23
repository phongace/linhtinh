import 'package:flutter/material.dart';
import 'package:time_store/models/album/album.dart';
import 'package:time_store/services/album-services.dart';
import 'package:time_store/styles/component.dart';

class DetailAlbum extends StatefulWidget {
  final num id;

  DetailAlbum({@required this.id});

  @override
  _DetailAlbumState createState() => _DetailAlbumState();
}

class _DetailAlbumState extends State<DetailAlbum> {
  Album album;

  @override
  void initState() {
    super.initState();
    AlbumService.getAlbumById(widget.id).then((value) {
      setState(() {
        album = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            child: Image.network(
              album?.url ?? '',
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
              color: CommonStyle.whiteColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red[50],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          album?.thumbnailUrl ?? '',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        'Album số: ${album?.albumId ?? ''}',
                        style: CommonStyle.defaultText(context, color: Colors.pinkAccent[700]),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    album?.title ?? '',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      letterSpacing: 0.6,
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thư viện',
                      style: CommonStyle.defaultText(context, color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage('images/image_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage('images/image_2.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage('images/image_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
