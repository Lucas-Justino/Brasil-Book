import 'package:brasil_book/components/delete_modal.dart';
import 'package:brasil_book/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:brasil_book/components/form_modal.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({super.key, required this.book});

  final Map<String, dynamic> book;

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  bool isEditModalVisible = false;
  bool isDeleteModalVisible = false;

  void toggleEditModal() {
    setState(() {
      isEditModalVisible = !isEditModalVisible;
    });
  }

  void toggleDeleteModal() {
    setState(() {
      isDeleteModalVisible = !isDeleteModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 250),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[400],
                  ),
                  child: IconButton(
                    onPressed: toggleEditModal,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.book['imageUrl'] ??
                              widget.book['volumeInfo']['imageLinks']
                                  ['thumbnail'],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[800],
                  ),
                  child: IconButton(
                    onPressed: toggleDeleteModal,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${widget.book["Titulo"] ?? widget.book['volumeInfo']['title']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '${widget.book["Autor"] ?? widget.book['volumeInfo']['authors'][0]}',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star,
                      color: index <
                              (widget.book['Rating']?.toInt() ??
                                  widget.book['volumeInfo']['averageRating']
                                      ?.toInt() ??
                                  5)
                          ? Colors.amber[300]
                          : Colors.grey[300]),
                ),
              ),
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
                  Text('${widget.book["Inicio"] ?? 'Data não informada'}'),
                  SizedBox(height: 5),
                  Text('${widget.book["Fim"] ?? 'Data não informada'}'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              color: const Color.fromARGB(255, 219, 214, 214),
              height: 15,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16),
                child: Text(
                  '${widget.book["Opiniao"] ?? 'Opinião não informada'}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Footer(),
          ],
        ),
        if (isEditModalVisible)
          FormModal(
            onClose: toggleEditModal,
            info: 'Editar',
            bookId: widget.book["id"],
          ),
        if (isDeleteModalVisible)
          DeleteModal(
            onClose: toggleDeleteModal,
            book: widget.book,
          ),
      ],
    );
  }
}
