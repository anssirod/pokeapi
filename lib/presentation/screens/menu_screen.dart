import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text('Поиск покемонов'),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            RaisedButton(
              child: const Text('Случайный покемон'),
              onPressed: () {
                Navigator.pushNamed(context, '/random');
              },
            ),
          ],
        ),
      ),
    );
  }
}
