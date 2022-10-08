import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:libreria/components/expanded_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del libro'),
        backgroundColor: Colors.grey[800],
        actions: [
          IconButton(
              onPressed: () => launchUrl(Uri.parse(book.selfLink)),
              icon: Icon(Icons.language)),
          IconButton(
              onPressed: () {
                Share.share("${book.title}\nPáginas: ${book.pageCount}");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 300,
                    child: Positioned.fill(
                      child: Image.network(book.imageLink),
                    )),
              ],
            ),
            Text(book.title),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          book.publishedDate,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Páginas: ${book.pageCount}"),
                      ],
                    ),
                  ],
                ),
                ExpandedText(
                  text: book.description,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox Separator() {
    return const SizedBox(
      height: 25,
    );
  }
}
