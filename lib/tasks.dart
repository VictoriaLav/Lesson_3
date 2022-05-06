// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Video Lessons',),
        title: Text('Home Lessons',
          style: TextStyle(
            fontFamily: 'light',
            fontSize: 40,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Изображения из папки assets',),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 200.0,
                onPageChanged: (page, reason) =>
                  setState(() => activePage = page),
              ),
              itemCount: imagesList.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(imagesList[index],
                      semanticsLabel: 'Изображение из папки assets ${imagesList[index]}',
                      height: 120,
                    ),
                );
              },
            ),
            //const SizedBox(height: 32),
            AnimatedSmoothIndicator(
              activeIndex: activePage,
              count: imagesList.length,
              effect: const ScaleEffect(
                activeDotColor: Colors.lightBlue,
              ),
            ),

            const SizedBox(height: 30),
            Text('Изображение из сети',),
            SvgPicture.network(
              //'https://drive.google.com/file/d/1pGoja0o_xqV6wmJBbzYtW1P3vTEW0hNS/view?usp=sharing',
              'https://svg-art.ru/wp-content/uploads/2014/04/header-page121.svg',
              semanticsLabel: 'Изображение из сети',
              width: 500,
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()
              ),
            ),
          ],
        ),
      ),
    );
  }
}


int activePage = 0;
List<String> imagesList = [];

void initList() {
  int lengthList = 5;
  for(int i = 1; i <= lengthList; i++) {
    imagesList.add('assets/images/Easter_$i.svg');
  }
}
