import 'package:flutter/material.dart';

class EmptyPassword extends StatelessWidget {
  const EmptyPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Icon(Icons.device_unknown),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'No Passwords',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingin menyimpan password anda?\n'
              'klik + untuk menambahkan data password !',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
