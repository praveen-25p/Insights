import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_flutter_website/models/video.dart';
import 'package:insights_flutter_website/services/youtube.dart';
import 'package:provider/provider.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _MobileHomeScreenState createState() => _MobileHomeScreenState();

  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  bool isLoading = true;
  List<Video> videos = [];

  Future<void> fetchVideos() async {
    await context.read<YoutubeService>().fetchVideos();
    videos = context.read<YoutubeService>().getVideos();
  }

  @override
  void initState() {
    super.initState();
    fetchVideos().then((value) {
      print("Videos fetched successfully!");
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.green[400], Colors.greenAccent])),
              child: Container(
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/hoob.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.person, 'profile', () => {}),
            CustomListTile(Icons.notifications, 'Notification', () => {}),
            CustomListTile(Icons.settings, 'Settings', () => {}),
            CustomListTile(Icons.logout, 'Logout', () => {}),
            CustomListTile(Icons.contacts_rounded, 'Contact us', () => {})
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[400],
        title: Text(
          "Insights",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black87,
                  offset: Offset(5.0, 5.0),
                )
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(screenHeight * 0.05),
                      height: screenHeight * 0.3,
                      width: screenHeight * 0.5,
                      // color: Colors.white,
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                              ),
                              items: List.generate(
                                videos.length,
                                (index) {
                                  return Image.network(
                                    videos[index].thumbnailUrl,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                    ),
                    Text('About Insights',
                        style: Theme.of(context).textTheme.headline3),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Center(
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              // color: Colors.orange,
              height: screenHeight * 0.70,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.asset(
                        'assets/insights.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: screenHeight * 50,
                      color: Theme.of(context).primaryColor,
                      child: Stack(
                        children: [
                          // Bottom layer (last layer) of the stack
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  // color: Colors.grey,
                                  child: SvgPicture.asset(
                                    'assets/arc.svg',
                                    color: Colors.brown,
                                    height: screenHeight * 0.1,
                                    width: screenHeight * 0.1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  // color: Colors.yellow,
                                  child: SvgPicture.asset(
                                    'assets/semicircle2.svg',
                                    color: Colors.brown,
                                    height: screenHeight * 0.15,
                                    width: screenHeight * 0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // First layer (top layer) of the stack
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              height: screenHeight * 0.76,
                              width: screenHeight * 0.76,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      width: screenHeight * 5.0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            color: Colors.blue[200],
                                          )),
                                          Expanded(
                                              child: Container(
                                            color: Colors.white,
                                            child: Center(
                                              child: Text('Required Text'),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: screenHeight * 0.02,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      // color: Colors.orange,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            color: Colors.blue[200],
                                          )),
                                          Expanded(
                                              child: Container(
                                            color: Colors.white,
                                            child: Center(
                                              child: Text('Required Text'),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Divider(
            //   height: 1.0,
            //   thickness: 1.0,
            //   color: Colors.black45,
            // ),
            Container(
              height: screenHeight * 0.51,
              // color: Colors.amber,
              child: Stack(
                children: [
                  // Last layer or the bottom layer of the stack
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          // height: screenHeight * 0.4,

                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  // Second layer of the stack
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/semicircle.svg',
                        color: Colors.brown,
                        width: screenHeight * 0.2,
                        height: screenHeight * 0.2,
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        // color: Colors.blue,
                        margin: EdgeInsets.only(
                          left: screenHeight * 0.25,
                          top: screenHeight * 0.06,
                        ),
                        child: SvgPicture.asset(
                          'assets/white_circle.svg',
                          color: Colors.white,
                          width: screenHeight * 0.15,
                          height: screenHeight * 0.15,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          // color: Colors.cyanAccent,
                          child: SvgPicture.asset(
                            'assets/semicirclearc2.svg',
                            color: Colors.brown,
                            width: screenHeight * 0.2,
                            height: screenHeight * 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // First layer of the stack(top layer)
                  Container(
                    // color: Colors.grey,
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.1, left: screenHeight * 0.16),
                    child: Text(
                      'Contact Us!',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: screenHeight * 0.05,
                        fontFamily: 'Glacial',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[400]))),
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
