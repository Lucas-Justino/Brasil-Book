import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String str1;
  final String str2;

  const ProfileInfo({super.key, required this.str1, required this.str2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 187, 186, 186),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                str1,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 151, 145, 145),
                ),
              ),
              Text(
                str2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(5, 37, 85, 1)),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Foto_Perfil.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
