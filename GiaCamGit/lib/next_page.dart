import 'package:flutter/material.dart';

//Trang sau
class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SelectableText('Login page'),
        backgroundColor: const Color.fromARGB(255, 255, 115, 0),
      ),
    );
  }
}