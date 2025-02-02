import 'package:flutter/material.dart';

import '../../../model/course.dart';

class FavoriteOption extends StatefulWidget {
  const FavoriteOption({super.key, required this.course});
  final Course course;

  @override
  State<FavoriteOption> createState() => _FavoriteOptionState();
}

class _FavoriteOptionState extends State<FavoriteOption> {
  bool isFavortie = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isFavortie = widget.course.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavortie = !isFavortie;
            widget.course.isFavorite = isFavortie;
          });
        },
        icon: Icon(
          isFavortie ? Icons.favorite : Icons.favorite_border,
          color: Colors.pink,
        ));
  }
}
