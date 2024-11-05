import 'package:brasil_book/components/delete_modal.dart';
import 'package:brasil_book/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:brasil_book/components/form_modal.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({super.key});

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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://m.media-amazon.com/images/I/81Ed9yMQWIL._AC_UF1000,1000_QL80_.jpg',
                      ),
                    ),
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
              'Título do Livro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Nome do Autor',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star, color: Colors.amber[300]),
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
                  Text('Data de Início'),
                  SizedBox(height: 5),
                  Text('Data de Término'),
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
                  'Minha opinião',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Footer(),
          ],
        ),
        if (isEditModalVisible) FormModal(onClose: toggleEditModal, titulo: 'Editar',),
        if (isDeleteModalVisible) DeleteModal(onClose: toggleDeleteModal),
      ],
    );
  }
}