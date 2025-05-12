import 'dart:io';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {

 final String title;
 final IconData icon;
 Colors? color;
 VoidCallback onPressed;
 File ? selectedImage;

 Options({required this.onPressed,this.color,this.selectedImage,required this.title, required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
                  IconButton(
                    color: selectedImage == null ? Colors.grey : Colors.red,
                    icon: Icon(icon),
                  onPressed: onPressed,
                  ),
                  Text(title)
                  ],
                  );
  }
}