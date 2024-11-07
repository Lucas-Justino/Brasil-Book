import 'package:brasil_book/components/catalog_search.dart';
import 'package:brasil_book/components/header.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String query;

  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            str1: 'Resultado da ',
            str2: 'Pesquisa',
          ),
          Expanded(
            child: CatalogSearch(
              query: widget.query,
            ),
          ),
        ],
      ),
    );
  }
}
