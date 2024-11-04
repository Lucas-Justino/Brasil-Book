import 'package:brasil_book/components/card_book.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [CardBook(), CardBook(), CardBook()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [CardBook(), CardBook(), CardBook()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [CardBook(), CardBook(), CardBook()],
        ),
      ],
    );
  }
}
