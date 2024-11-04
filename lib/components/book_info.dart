import 'package:brasil_book/components/footer.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 200,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://m.media-amazon.com/images/I/81Ed9yMQWIL._AC_UF1000,1000_QL80_.jpg'),
                  ),
                ),
              ),
              Text(
                'Titulo do Livro',
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
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[300],
                    ),
                  ],
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
                    Text('Data de Inicio'),
                    SizedBox(
                      height: 5,
                    ),
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
                    'Minha opinião ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Footer(),
            ],
          ),
          Positioned(
            right: 50,
            top: 200,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue[400]),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
