import 'package:brasil_book/components/provider/catalog_notifier.dart';
import 'package:brasil_book/components/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookInfoSearch extends StatefulWidget {
  final Map<String, dynamic> book;

  const BookInfoSearch({super.key, required this.book});

  @override
  State<BookInfoSearch> createState() => _BookInfoSearchState();
}

class _BookInfoSearchState extends State<BookInfoSearch> {
  Future<void> _addBook(BuildContext context) async {
    await context.read<CatalogNotifier>().addBook(widget.book);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.book['volumeInfo']
                            ['imageLinks']['thumbnail']),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[400],
                  ),
                  child: IconButton(
                    onPressed: () {
                      _addBook(context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${widget.book['volumeInfo']['title']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '${widget.book['volumeInfo']['authors'][0]}',
              style: TextStyle(fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: double.infinity,
              color: const Color.fromARGB(255, 219, 214, 214),
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 260,
                    child: SingleChildScrollView(
                      scrollDirection:
                          Axis.vertical,
                      child: Text(
                        '${widget.book['volumeInfo']['description']}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
