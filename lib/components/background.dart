import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Map<String, dynamic> book;

  final String? url;

  const Background({super.key, required this.book, this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                book['imageUrl'] ??
                    book['volumeInfo']['imageLinks']['thumbnail'],
              ),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.05),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 16,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 48, 48, 48),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}