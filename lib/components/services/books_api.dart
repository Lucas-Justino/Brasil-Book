import 'dart:convert';

import 'package:http/http.dart' as http;

class BooksApi {
  Future<String> searchImage(String query) async {
      final url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query');
      try {
        final response = await http.get(url);

        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          final Map<String, dynamic> firstBook = data['items'][0];
          return firstBook['volumeInfo']['imageLinks']['thumbnail']; 
        }
      }
      catch (e) {
        print('Erro em buscar imagem $e');
      }
    return '';
  }
}