import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class FormModal extends StatefulWidget {
  final VoidCallback onClose;

  final String info;

  FormModal({super.key, required this.onClose, required this.info});

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _opiniaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataFimController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    _opiniaoController.dispose();
    _dataInicioController.dispose();
    _dataFimController.dispose();
    super.dispose();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _addUser() async {
    final book = <String, dynamic>{
      "Titulo": _tituloController.text,
      "Autor": _autorController.text,
      "Opiniao": _opiniaoController.text,
      "Inicio": _dataInicioController.text,
      "Fim": _dataFimController.text
    };

    // Adiciona um novo documento com um ID gerado
    db.collection("books").add(book).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
    }).catchError((error) {
      print("Error adding document: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  '${widget.info} Informações',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _autorController,
                decoration: InputDecoration(
                  labelText: 'Autor',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _opiniaoController,
                decoration: InputDecoration(
                  labelText: 'Minha Opinião',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dataInicioController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Data de Início',
                  hintText: 'DD/MM/AAAA',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('##/##/####')],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dataFimController,
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: 'Data de Término',
                    hintText: 'DD/MM/AAAA',
                    border: OutlineInputBorder(),
                    counterText: ''),
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('##/##/####')],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: widget.onClose,
                    child: Text('Cancelar'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      widget.onClose();
                      _addUser();
                    },
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
