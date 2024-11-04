import 'package:brasil_book/components/add_book.dart';
import 'package:brasil_book/components/catalog.dart';
import 'package:brasil_book/components/footer.dart';
import 'package:brasil_book/components/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
