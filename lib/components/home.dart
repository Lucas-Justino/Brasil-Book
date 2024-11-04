import 'package:brasil_book/components/add_book.dart';
import 'package:brasil_book/components/catalog.dart';
import 'package:brasil_book/components/footer.dart';
import 'package:brasil_book/components/header.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Header(),
              Expanded(
                child: Catalog(),
              ),
              Footer(),
            ],
          ),
          Positioned(
            bottom: 40,
            right: 0,
            child: AddBook(),
          ),
        ],
      ),
    );
  }
}
