import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

import 'package:quiz_1/ui/berita.dart';
import 'package:quiz_1/ui/sejarah.dart';
import 'package:quiz_1/ui/visi.dart';
import 'package:quiz_1/ui/kontak.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static final List<String> imgSlider = [
    '4c-competition.jpg',
    'BANNER-AKRED-PTI.jpg',
    'banner-update-data.jpg',
    'BANNER_UAS.jpg',
    'info-kuliah.jpg',
    'infolms.jpg',
    'PK2MABA2020.jpg'
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/$fileImage',
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 150,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 6 / 3,
  );

  static const String FEED_URL =
      'https://filkom.ub.ac.id/rss/feed';
  RssFeed _feed;
  String _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(result);
      updateTitle("Berita");
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      //
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  title2(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.blue),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100, color: Colors.black),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  list() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return ListTile(
          title: title(item.title),
          subtitle: subtitle(item.pubDate),
          trailing: rightIcon(),
          contentPadding: EdgeInsets.all(5.0),
          onTap: () => openFeed(item.link),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        ListView(
          children: <Widget>[
            //Container digunakan untuk menampilkan field informasi
            autoPlayImage,
            SizedBox(
              height: 25.0,
            ),
            //kode untuk menampilkan teks 'Halo, pengunjung'
            Center(
              child: Text(
                "Halo, Pengunjung",
                style: TextStyle(
                    color: Colors.blueAccent[200],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 150.0,
              width: 100.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 3,
                    // changes position of shadow
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.home,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: null
                          ),
                          Text("Home")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.perm_identity,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Sejarah()),
                                );
                              }
                          ),
                          Text("Sejarah")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.account_balance,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Visi()),
                                );
                              }
                          ),
                          Text("Visi Misi")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.map_outlined,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: () => openFeed("https://goo.gl/maps/fYqyxGszu9m48XLCA")),
                          Text("Peta")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.assignment,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Berita()),
                                );
                              }
                          ),
                          Text("Berita")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.call,
                                size: 38,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Kontak()),
                                );
                              }
                              ),
                          Text("Kontak")
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            //kode untuk menampilkan teks 'Berita terkini'
            ListTile(
              title: title("Berita Terkini"),
              trailing: title2("lihat selengkapnya"),
              contentPadding: EdgeInsets.all(5.0),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Berita()
                ),
              ),
            ),
            SafeArea(
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 300.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 3,
                        // changes position of shadow
                      )
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: isFeedEmpty()
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : RefreshIndicator(
                    key: _refreshKey,
                    child: list(),
                    onRefresh: () => load(),
                  )
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
