import 'package:brasil_book/components/background.dart';
import 'package:brasil_book/components/book_info.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookScreen({super.key, required this.book});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            book: widget.book,
          ),
          BookInfo(
            book: widget.book,
          )
        ],
      ),
    );
  }
}
