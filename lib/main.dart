import 'package:quiz_1/ui/berita.dart';
import 'package:quiz_1/ui/home.dart';
import 'package:quiz_1/ui/about.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//judul
      title: 'Gapura FILKOM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _layoutPage = [
    Home(),
    Berita(),
    About(),
  ];

//Digunakan untuk menyeleksi set style
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Digunakan untuk menampilkan app bar
      appBar: AppBar(
        //Judul dari app bar
          title: Text('Gapura Filkom'),
          //aksi untuk menampilkan setting
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(
                      Icons.notifications
                  ),
                )
            ),
          ]
      ),
      body: _layoutPage.elementAt(_selectedIndex),
      //Kode digunakan untuk menampilkan menu di bawah aplikasi berupa icon dan label
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      //Drawer digunakan untuk menampilkan menu disamping ketika di tap
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('FILKOM UB'),
              accountEmail: Text('filkom@ub.ac.id'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('ABC'),
              ),
            ),
            ListTile(
              title: Text('Inbox'),
              leading: Icon(Icons.mail),
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
            ),
            ListTile(
                title: Text('Info'),
                leading: Icon(Icons.info)
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
