import 'package:flutter/material.dart';

class Visi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Visi Misi Filkom"),
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
                        title: Text("Visi"),
                        subtitle: Text("Pada tahun 2024, menjadi fakultas unggul yang bereputasi internasional dalam rumpun keilmuan komputer dan berperan aktif dalam rangka mendukung pembangunan bangsa melalui integrasi tri darma perguruan tinggi."),
                      ),
                      ListTile(
                        title: Text("Misi"),
                        subtitle: Text("1. Menyelenggarakan pendidikan berstandar internasional dalam rumpun keilmuan komputer yang berkualitas untuk menghasilkan lulusan berkepribadian luhur serta memiliki jiwa kewirausahaan.\n2. Mengembangkan ilmu pengetahuan dalam rumpun keilmuan komputer dengan mengedepankan moral dan etika serta didukung oleh pengembangan sumberdaya berkelanjutan.\n3. Melaksanakan pengabdian pada masyarakat dalam rumpun keilmuan komputer secara berkelanjutan dalam rangka mendukung pembangunan bangsa.\n4. Membangun kerjasama dengan berbagai pihak terkait dalam rumpun keilmuan komputer di tingkat nasional maupun internasional."),
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