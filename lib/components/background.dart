import 'dart:ui';

import 'package:brasil_book/components/book_info.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

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
                  'https://m.media-amazon.com/images/I/81Ed9yMQWIL._AC_UF1000,1000_QL80_.jpg'),
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
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        BookInfo(),
      ],
    );
  }
}