import 'package:brasil_book/components/profile_info.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String str1;
  final String str2;

  const Header({super.key, required this.str1, required this.str2});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left),
                color: Colors.blue[400],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: const Color.fromARGB(255, 151, 145, 145),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                    color: const Color.fromARGB(255, 151, 145, 145),
                  ),
                ],
              ),
            ],
          ),
          ProfileInfo(str1: widget.str1, str2: widget.str2, ),
        ],
      ),
    );
  }
}
