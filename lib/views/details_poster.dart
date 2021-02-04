import 'package:flutter/material.dart';

class DetailsPoster extends StatelessWidget {
  final String imageUrl, title, desc, content, url;

  const DetailsPoster(
      {Key key, this.imageUrl, this.title, this.content, this.desc, this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
      ),
      body: Column(
        children: [
          Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
