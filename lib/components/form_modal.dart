import 'package:brasil_book/components/provider/catalog_notifier.dart';
import 'package:brasil_book/components/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:provider/provider.dart';

class FormModal extends StatefulWidget {
  final VoidCallback onClose;
  final String info;
  final String? bookId;

  FormModal(
      {super.key, required this.onClose, required this.info, this.bookId});

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _opiniaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataFimController = TextEditingController();

  int _selectedRating = 0;

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    _opiniaoController.dispose();
    _dataInicioController.dispose();
    _dataFimController.dispose();
    super.dispose();
  }

  Future<void> _addBook(BuildContext context) async {
    final book = <String, dynamic>{
      "Titulo": _tituloController.text != ""
          ? _tituloController.text
          : "Titulo Desconhecido",
      "Autor": _autorController.text != ""
          ? _autorController.text
          : "Autor Desconhecido",
      "Opiniao": _opiniaoController.text != ""
          ? _opiniaoController.text
          : "Opinião não informada",
      "Inicio": _dataInicioController.text != ""
          ? "Data de Início: ${_dataInicioController.text}"
          : "Data de início não informada",
      "Fim": _dataFimController.text != ""
          ? "Data do Término: ${_dataFimController.text}"
          : "Data do término não informada",
      "Rating": _selectedRating,
    };

    await context.read<CatalogNotifier>().addBook(book);
    widget.onClose();
  }

  Future<void> _editBook() async {
    final newBook = <String, dynamic>{
      "Titulo": _tituloController.text != ""
          ? _tituloController.text
          : "Titulo Desconhecido",
      "Autor": _autorController.text != ""
          ? _autorController.text
          : "Autor Desconhecido",
      "Opiniao": _opiniaoController.text != ""
          ? _opiniaoController.text
          : "Opinião não informada",
      "Inicio": _dataInicioController.text != ""
          ? "Data de Início: ${_dataInicioController.text}"
          : "Data de início não informada",
      "Fim": _dataFimController.text != ""
          ? "Data do Término: ${_dataFimController.text}"
          : "Data do término não informada",
      "Rating": _selectedRating,
    };

    await context.read<CatalogNotifier>().editBook(widget.bookId!, newBook);
    widget.onClose();
    Navigator.pop(context);
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
              Text(
                '${widget.info} Informações',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                inputFormatters: [
                  MaskedInputFormatter('##/##/####'),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dataFimController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Data de Término',
                  hintText: 'DD/MM/AAAA',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedInputFormatter('##/##/####'),
                ],
              ),
              SizedBox(height: 20),
              StarRating(
                onRatingSelected: (rating) {
                  setState(() {
                    _selectedRating = rating;
                  });
                },
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
                    onPressed: () => {
                      widget.info == "Editar" ? _editBook() : _addBook(context)
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
