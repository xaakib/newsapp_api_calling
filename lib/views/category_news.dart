import 'package:flutter/material.dart';
import 'package:newsapp_api_calling/helper/news.dart';
import 'package:newsapp_api_calling/model/article_model.dart';
import 'package:newsapp_api_calling/widgets/poster_widget.dart';

class CategoryNews extends StatefulWidget {
  final String categorie;

  const CategoryNews({Key key, this.categorie}) : super(key: key);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  // ignore: deprecated_member_use
  List<ArticleModel> articles = List();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    CategoriNewsClass newsClass = CategoriNewsClass();
    await newsClass.getNews(widget.categorie);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categorie),
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
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      content: articles[index].content,
                      url: articles[index].url,
                    );
                  }),
            ),
    );
  }
}
