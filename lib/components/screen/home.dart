import 'package:brasil_book/components/add_book.dart';
import 'package:brasil_book/components/catalog.dart';
import 'package:brasil_book/components/footer.dart';
import 'package:brasil_book/components/form_modal.dart';
import 'package:brasil_book/components/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAddModalVisible = false;

  void toggleModal() {
    setState(() {
      isAddModalVisible = !isAddModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
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
            child: AddBook(onClose: toggleModal),
          ),
          if (isAddModalVisible)
            Center(
              child: FormModal(onClose: toggleModal, info: 'Adicionar',),
            ),
        ],
      ),
    );
  }
}
