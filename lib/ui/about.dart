import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _About createState() => _About();
}

class _About extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      title: Text("FAKULTAS ILMU KOMPUTER (FILKOM) UB"),
                      subtitle: Text("Dalam tujuannya untuk mencetak lulusan yang kompeten dalam bidang Teknologi Informasi, Fakultas Ilmu Komputer (FILKOM) Universitas Brawijaya menerapkan kurikulum berbasis kompetensi yang merujuk pada ABET (Accreditation Board for Engineering and Technology). Didukung dengan tenaga pendidik berkualitas dan sarana prasarana pendukung yang memadai, FILKOM bertujuan untuk menghasilkan lulusan yang berjiwa enterpreneur berbasis pada moral dan etika serta dapat dipercaya sehingga mampu bekerjasama dan memberikan kontribusi di tingkat nasional dan internasional."),
                    ),
                    ListTile(
                      title: Text("Jurusan dan Program Studi"),
                      subtitle: Text("Fakultas Ilmu Komputer Universitas Brawijaya memiliki dua pilihan jurusan yaitu jurusan Teknik Informatika dan jurusan Sistem Informasi. Jurusan Teknik Informatika menawarkan tiga macam pilihan program studi (PS) meliputi PS. Magister Ilmu Komputer, PS. Teknik Informatika dan PS. Teknik Komputer. Sementara jurusan Sistem Informasi terdiri atas PS. Pendidikan Teknologi Informasi, PS. Sistem Informasi dan PS. Teknologi Informasi."),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
