import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiunsplash/models/UnsplashPhoto.dart';
import 'package:flutterapiunsplash/repos/mainpage_repo.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Reading API"),
      backgroundColor: Colors.blueGrey,
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder,
    );
  }

  get _buildFutureBuilder {
    return FutureBuilder<UnsplashPhoto>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          print(snapshot.error);
          return Center(
            child: Text("Something went wrong while reading API."),
          );
        }

        else {
          if (snapshot.connectionState == ConnectionState.done) {
            print("mainpage.dart, snapshot.data.total: ${snapshot.data.total}");
            return _buildGridView(snapshot.data.results);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  _buildGridView(List<Result> results) {
    return GridView.builder(
        itemCount: results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
        ),
        itemBuilder: (context, index) {
          return _buildItem(results[index]);
        });
  }

  _buildItem(Result result) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: result.urls.small,
          placeholder: (context, url) => Container(
            color: Colors.grey[200],
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
