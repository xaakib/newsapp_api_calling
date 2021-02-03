import 'package:flutter/material.dart';
import 'package:newsapp_api_calling/helper/news.dart';
import 'package:newsapp_api_calling/model/article_model.dart';
import 'package:newsapp_api_calling/model/categori_model.dart';

import 'articale_view.dart';

class CategoriScreen extends StatefulWidget {
  final name;

  const CategoriScreen({Key key, this.name}) : super(key: key);
  @override
  _CategoriScreenState createState() => _CategoriScreenState();
}

class _CategoriScreenState extends State<CategoriScreen> {
  bool _loading = true;
  // ignore: deprecated_member_use
  List<Buissiness> buissiness = List<Buissiness>();

  @override
  void initState() {
    super.initState();
    germanyNews();
  }

  germanyNews() async {
    News newsClass = News();
    await newsClass.germanyNews();
    buissiness = newsClass.buissi;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: buissiness.length,
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imageUrl: buissiness[index].urlToImage,
                      title: buissiness[index].title,
                      desc: buissiness[index].description,
                      url: buissiness[index].url,
                    );
                  }),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticalView(
                      blogUrl: url,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(imageUrl)),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
