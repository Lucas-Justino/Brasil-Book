import 'package:flutter/material.dart';

class CardBook extends StatelessWidget {
  const CardBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://books.google.com.br/books/content?id=3wohEJsBaI0C&hl=pt-BR&pg=PP1&img=1&zoom=3&bul=1&sig=ACfU3U01disCzahbVubOE78P8jRz1B56YA&w=1280'))),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber[300],
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.amber[300],
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.amber[300],
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.amber[300],
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.amber[300],
              size: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
