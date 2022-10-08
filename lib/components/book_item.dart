import 'package:flutter/material.dart';
import 'package:libreria/classes/book.dart';
import 'package:libreria/screens/book_detail.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BookDetail(book: book)));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: 100,
            child: Positioned.fill(
                child: bookImage(book.imageLink != "" ? true : false)),
          ),
          Text(
            book.title,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget bookImage(bool haveImage) {
    return haveImage
        ? Image.network(book.imageLink)
        : Placeholder(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Image Not Found",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
