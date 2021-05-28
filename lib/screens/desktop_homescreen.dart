import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_flutter_website/services/youtube.dart';
import 'package:provider/provider.dart';
import 'package:insights_flutter_website/models/video.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _DesktopHomeScreenState createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // First landing page
            Container(
              height: screenWidth * 0.51,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth * 0.35,
                    color: Theme.of(context).primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: screenWidth * 0.36,
                        width: screenWidth * 0.64,
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        color: Colors.blue[100],
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
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.grey,
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Insights',
                                // style: Theme.of(context).textTheme.headline1,
                                style: TextStyle(
                                  color: Color.fromRGBO(204, 255, 204, 1),
                                  fontSize: screenWidth * 0.05,
                                  fontFamily: 'Glacial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 3,
                                color: Colors.brown,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'CAREERS·LIFESTYLE·VLOGS',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: screenWidth * 0.02,
                                    fontFamily: 'Glacial'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 3,
                                color: Colors.brown,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Second page
            Container(
              // color: Colors.orange,
              height: screenWidth * 0.51,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.blue,
                      child: Image.asset(
                        'assets/insights.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: Stack(
                        children: [
                          // Bottom layer (last layer) of the stack
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  // color: Colors.grey,
                                  child: SvgPicture.asset(
                                    'assets/arc.svg',
                                    color: Colors.brown,
                                    height: screenWidth * 0.1,
                                    width: screenWidth * 0.1,
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
                                    height: screenWidth * 0.15,
                                    width: screenWidth * 0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // First layer (top layer) of the stack
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(screenWidth * 0.05),
                                  // color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        color: Colors.orange,
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
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(screenWidth * 0.05),
                                  // color: Colors.orange,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        color: Colors.orange,
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            // Third Page
            Container(
              height: screenWidth * 0.51,
              // color: Colors.amber,
              child: Stack(
                children: [
                  // Last layer or the bottom layer of the stack
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          // height: screenWidth * 0.4,
                          width: screenWidth,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
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
                        width: screenWidth * 0.2,
                        height: screenWidth * 0.2,
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        // color: Colors.blue,
                        margin: EdgeInsets.only(
                          left: screenWidth * 0.25,
                          top: screenWidth * 0.06,
                        ),
                        child: SvgPicture.asset(
                          'assets/white_circle.svg',
                          color: Colors.white,
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          // color: Colors.cyanAccent,
                          child: SvgPicture.asset(
                            'assets/semicirclearc2.svg',
                            color: Colors.brown,
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // First layer of the stack(top layer)
                  Container(
                    // color: Colors.grey,
                    margin: EdgeInsets.only(
                        top: screenWidth * 0.1, left: screenWidth * 0.16),
                    child: Text(
                      'Contact Us!',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: screenWidth * 0.05,
                        fontFamily: 'Glacial',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
