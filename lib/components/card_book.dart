import 'package:flutter/material.dart';
import 'package:brasil_book/components/screen/book.dart';

class CardBook extends StatelessWidget {
  final String imageUrl;
  final Map<String, dynamic> book;

  const CardBook({
    super.key,
    required this.imageUrl,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookScreen(book: book,),
              ),
            );
          },
          child: Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < book['Rating'].toInt() ? Colors.amber[300] : Colors.grey[300],
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
