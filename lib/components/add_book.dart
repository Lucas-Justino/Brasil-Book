import 'package:brasil_book/components/form_modal.dart';
import 'package:flutter/material.dart';

class AddBook extends StatefulWidget {
  final VoidCallback onClose;

  const AddBook({super.key, required this.onClose});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: widget.onClose,
            child: Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[400],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
