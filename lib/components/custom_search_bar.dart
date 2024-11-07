import 'package:brasil_book/components/screen/search.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchBook() async {
    print(_searchController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(query: _searchController.text,)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 8),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFEDE6EE),
      ),
      child: TextField(
        controller: _searchController,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: 'Não encontrou seu livro? Pesquise aqui',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 134, 134, 134),
          ),
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {
              searchBook();
            },
            icon: Icon(Icons.search),
          ),
          contentPadding: EdgeInsets.only(top: 13)
        ),
      ),
    );
  }
}
