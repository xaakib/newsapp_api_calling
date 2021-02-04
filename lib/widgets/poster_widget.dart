import 'package:flutter/material.dart';
import 'package:newsapp_api_calling/views/details_poster.dart';
import 'package:page_transition/page_transition.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url, content;

  const BlogTile(
      {@required this.imageUrl,
      @required this.content,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                child: DetailsPoster(
                  imageUrl: imageUrl,
                  title: title,
                  desc: desc,
                  content: content,
                  url: url,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Hero(
                  tag: imageUrl,
                  child: Image.network(imageUrl),
                ),
              ),
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
