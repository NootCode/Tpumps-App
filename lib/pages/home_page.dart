import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "https://www.visitpasadena.com/imager/s3_us-west-1_amazonaws_com/pasadena-2020/images/blog-images/TPumps-945x596_bc0d2157d501d4729a3d5631708a6b2e.jpg",
  "https://pbs.twimg.com/media/D_neWiYVUAAuCkn.jpg",
  "https://pbs.twimg.com/profile_images/923049648121511936/ouoA5ZUp_400x400.jpg",
  "https://media.timeout.com/images/103068948/630/472/image.jpg",
  "https://www.pasadenastarnews.com/wp-content/uploads/migration/2016/201603/NEWS_160339970_AR_0_NSIGDKGEHMXF.jpg",
];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  var last = 0;
  String dailyDrink = "";
  var drinkOfTheDay = [
    "Mango Peach Passion Green Tea",
    "Rose Vanilla Green Milk Tea",
    "Blackberry Peach Black Tea",
    "Pineapple Kiwi Green Tea",
    "Rose Lychee Peach Green Tea",
    "Mango Coconut Vanilla Green Milk Tea",
    "Salted Caramel Cookie Dough Black Milk Tea",
    "Salted Caramel Hazelnut Chocolate Black Milk Tea",
    "Raspberry Lemon Black Tea",
    "Blueberry Pomergranate Black Tea",
  ];

  @override
  void initState() {
    super.initState();
    dailyDrink = drinkOfTheDay[0];
  }

  setDrinkofTheDay() {
    var rng = new Random();
    var next = rng.nextInt(drinkOfTheDay.length);
    while (next == last) {
      rng.nextInt(drinkOfTheDay.length);
    }
    last = next;
    setState(() {
      dailyDrink = drinkOfTheDay[next];
    });
    print(drinkOfTheDay[next]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff232b2b),
        title: Center(
          child: Image(
            image: NetworkImage(
                'https://static.wixstatic.com/media/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.png/v1/crop/x_0,y_382,w_3552,h_1277/fill/w_460,h_166,al_c,q_85,usm_0.66_1.00_0.01/131e23_5b7a1179131a40b8b7badda0ebf119ef~mv2_d_3552_1998_s_2.webp'),
            fit: BoxFit.cover,
            height: 100,
          ),
        ),
      ),
      body: Container(
        color: Color(0xff3b444b),
        child: Column(
          children: [
            Expanded(
              flex: 50,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                  child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                                height: 1000,
                              )),
                            ))
                        .toList(),
                  )),
            ),
            Expanded(
              flex: 30,
              child: Container(
                margin: EdgeInsets.only(top: 70),
                child: Text(
                  "DRINK OF THE DAY",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xfff5fafa),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                child: Text(
                  dailyDrink,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xfff5fafa),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
