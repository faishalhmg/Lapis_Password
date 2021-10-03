import 'package:flutter/material.dart';

class AppDesc extends StatelessWidget {
  const AppDesc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Image.network(
                'https://media.discordapp.net/attachments/833569824625524767/894245832805728306/lxl.png',
                scale: 2,
              ),
            ),
          ),
          Center(
            child: Text('LAPIS PASWORD',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 40)),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                    'LAPIS PASWORD adalah Aplikasi untuk menyimpan password tanpa terkoneksi dengan internet.',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Cocok untuk anda yang memiliki banyak akun dan hanya mengandalkan notepad untuk menyimpannya.',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.normal,
                          fontSize: 20)),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Text('Dibuat Oleh : \n',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w900,
                    fontSize: 15)),
          ),
          Text('Faishal Hariz Makaarim Gandadipoera',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 15)),
          Text('NPM : 1917051065',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 15)),
          Divider(),
        ],
      ),
    );
  }
}
