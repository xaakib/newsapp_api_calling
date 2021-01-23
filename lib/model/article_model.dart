class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAtt;

  ArticleModel(
      {this.title,
      this.publishedAtt,
      this.author,
      this.content,
      this.description,
      this.url,
      this.urlToImage});
}
