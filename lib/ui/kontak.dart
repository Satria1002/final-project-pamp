import 'package:flutter/material.dart';

class Kontak extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kontak"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("FILKOM WA Center"),
                        subtitle: Text("0812 5986 1603"),
                      ),
                      ListTile(
                        title: Text("Akademik WA Center"),
                        subtitle: Text("0811 3225 7272"),
                      ),
                      ListTile(
                        title: Text("UKT WA Center"),
                        subtitle: Text("0811 3225 4666"),
                      ),
                      ListTile(
                        title: Text("Jurusan Teknik Informatika"),
                        subtitle: Text("0811 3222 9696"),
                      ),
                      ListTile(
                        title: Text("Jurusan Sistem Informasi"),
                        subtitle: Text("0811 3227 5151"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}