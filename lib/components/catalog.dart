import 'package:brasil_book/components/provider/catalog_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brasil_book/components/card_book.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogProvider = Provider.of<CatalogNotifier>(context);

    return Scaffold(
      body: catalogProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.54,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemCount: catalogProvider.books.length,
              itemBuilder: (context, index) {
                final book = catalogProvider.books[index];
                return CardBook(
                  imageUrl: book['imageUrl'] ?? 'https://m.media-amazon.com/images/I/81Ed9yMQWIL._AC_UF1000,1000_QL80_.jpg',
                  book: book,
                );
              },
            ),
    );
  }
}
