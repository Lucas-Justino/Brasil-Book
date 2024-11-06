import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CatalogNotifier extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> books = [];
  bool isLoading = true;

  CatalogNotifier() {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      QuerySnapshot event = await db.collection("books").get();
      books = event.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
        }).toList();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("Erro ao buscar livros: $e");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addBook(Map<String, dynamic> book) async {
    try {
      await db.collection("books").add(book);
      fetchBooks();
    } catch (e) {
      print("Erro ao adicionar livro: $e");
    }
  }
}
