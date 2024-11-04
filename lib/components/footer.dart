import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_outlined),
          Icon(Icons.rocket_launch_outlined),
          Icon(Icons.search),
          Icon(Icons.local_library_outlined),
          Icon(Icons.person_outline)
        ],
      ),
    );
  }
}
