import 'package:brasil_book/components/provider/catalog_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteModal extends StatefulWidget {
  final VoidCallback onClose;

  final Map<String, dynamic> book;

  const DeleteModal({super.key, required this.onClose, required this.book});

  @override
  State<DeleteModal> createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {

  Future<void> _removeBook(String bookId) async {
    await context.read<CatalogNotifier>().removeBook(bookId);
    widget.onClose();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Excluir Livro',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: widget.onClose,
                      child: Text(
                        'Cancelar',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.red[800]),
                      ),
                      onPressed: () => _removeBook(widget.book["id"]),
                      child: Text(
                        'Excluir',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
