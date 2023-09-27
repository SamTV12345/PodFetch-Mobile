import 'package:flutter/cupertino.dart';

class HomeWindowBody extends StatelessWidget {
  const HomeWindowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Text('Home Window Body'),
        ],
      ),
    );
  }
}