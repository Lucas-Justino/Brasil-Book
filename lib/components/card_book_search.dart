import 'package:brasil_book/components/screen/book_search.dart';
import 'package:flutter/material.dart';

class CardBookSearch extends StatelessWidget {
  final Map<String, dynamic> book;

  const CardBookSearch({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookSearch(
              book: book,
            ),
          ),
        );
        print(book['volumeInfo']['title']);
      },
      child: Image.network(book['volumeInfo']['imageLinks']['thumbnail']),
    );
  }
}
