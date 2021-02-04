class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String name;
  String content;

  ArticleModel(
      {this.title,
      this.name,
      this.author,
      this.content,
      this.description,
      this.url,
      this.urlToImage});
}

class SourceElement {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String name;
  String content;

  SourceElement(
      {this.title,
      this.name,
      this.author,
      this.content,
      this.description,
      this.url,
      this.urlToImage});
}
