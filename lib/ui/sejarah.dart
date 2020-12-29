import 'package:flutter/material.dart';

class Sejarah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sejarah FILKOM"),
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
                        title: Text("Merujuk pada SK Dikti No.163/KEP/DIKTI/2007 mengenai penataan dan kodifikasi Program Studi, dibentuklah Program Teknologi Informasi dan Ilmu Komputer (PTIIK) berdasarkan Surat Keputusan Rektor Universitas Brawijaya Nomor: 516/SK/2011 tanggal 27 Oktober 2011 yang merupakan gabungan dari 2 program studi (Teknik Perangkat Lunak dari Fakultas Teknik dan Ilmu Komputer dari Fakultas MIPA) yang telah ada di Universitas Brawijaya dimana kedua program studi tersebut memiliki kesamaan dan kesesuaian hakekat sebuah disiplin ilmu. Kemudian pada 10 Desember 2014 PTIIK resmi menjadi Fakultas Ilmu Komputer (FILKOM) berdasarkan Surat Dikti No. 8073/EI/OT/2014 tentang Organisasi dan Tata Kerja Universitas Brawijaya."),
                      ),
                      ListTile(
                        title: Text("Saat ini FILKOM bertempat di Jl. Veteran No. 8 Malang. Telah memiliki dua jurusan dan masing-masing jurusan menawarkan tiga program studi (prodi)"),
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