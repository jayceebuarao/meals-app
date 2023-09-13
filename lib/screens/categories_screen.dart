import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        children: const [
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('1', style: TextStyle(color: Colors.white))),
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('2', style: TextStyle(color: Colors.white))),
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('3', style: TextStyle(color: Colors.white))),
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('4', style: TextStyle(color: Colors.white))),
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('5', style: TextStyle(color: Colors.white))),
          Card(
              color: Color.fromRGBO(136, 33, 156, 1),
              child: Text('6', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
