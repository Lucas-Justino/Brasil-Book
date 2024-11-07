import 'package:brasil_book/components/card_book_search.dart';
import 'package:brasil_book/components/services/books_api.dart';
import 'package:flutter/material.dart';

class CatalogSearch extends StatefulWidget {
  final String query;

  const CatalogSearch({super.key, required this.query});

  @override
  State<CatalogSearch> createState() => _CatalogSearchState();
}

class _CatalogSearchState extends State<CatalogSearch> {
  final BooksApi _booksApi = BooksApi();
  List<Map<String, dynamic>> books = [];

  @override
  void initState() {
    super.initState();
    searchBooks();
  }

  Future<void> searchBooks() async {
    List<Map<String, dynamic>> result =
        await _booksApi.searchBooks('Como eu era antes de voce');
    setState(() {
      books = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return CardBookSearch(book: book);
      },
    );
  }
}
