import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCupertinoPage extends StatelessWidget {
  const LoadingCupertinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CupertinoButton(
              onPressed: () {},
              child: const Text("Contoh button"),
            ),
            const SizedBox(height: 12),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
