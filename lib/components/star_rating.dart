import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingSelected;

  const StarRating({
    super.key,
    this.maxRating = 5,
    required this.onRatingSelected,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _selectedRating = 0;

  void _onStarTap(int index) {
    setState(() {
      _selectedRating = index + 1;
    });
    widget.onRatingSelected(_selectedRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maxRating,
        (index) => GestureDetector(
          onTap: () => _onStarTap(index),
          child: Icon(
            Icons.star,
            color: index < _selectedRating ? Colors.amber[300] : Colors.grey[300],
            size: 30,
          ),
        ),
      ),
    );
  }
}
