import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  EditText({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.edit),
      onTap: onTap,
    );
  }
}
