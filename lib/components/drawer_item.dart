import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final String path;

  const DrawerListItem({super.key, required this.title, required this.icon,
    required this.path});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.blue,
      selected: ModalRoute.of(context)?.settings.name == path,
      leading: icon,
      title: Text(title),
      onTap: () {
          Navigator.of(context).pushNamed(path);
      },
    );
  }

}