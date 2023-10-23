import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String pageName;
  final String title;
  final String selectedTitle;
  const DrawerItem({
    required this.selectedTitle,
    required this.pageName,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;

    if (title == selectedTitle){
      color = Theme.of(context).hintColor;
    }
    else {
      color = Colors.white;
    }

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, pageName);
      },
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}