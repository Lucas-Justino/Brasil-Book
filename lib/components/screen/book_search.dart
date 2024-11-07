import 'package:brasil_book/components/background.dart';
import 'package:brasil_book/components/book_info_search.dart';
import 'package:flutter/material.dart';

class BookSearch extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookSearch({super.key, required this.book});

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            book: widget.book,
            url: widget.book['volumeInfo']['imageLinks']['thumbnail'],
          ),
          BookInfoSearch(book: widget.book),
        ],
      ),
    );
  }
}
