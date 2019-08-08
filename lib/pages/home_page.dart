import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    List _imageUrls=[
      'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
      'http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
      'http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
    ];


    return Scaffold(
      body: Center(
        child:  Column(
            children: <Widget>[
              Container(
                height: 160,
                color: Colors.blueGrey,
                child: Swiper(
                  autoplay: true,
                  itemCount: _imageUrls.length,
                  itemBuilder: (BuildContext context,int index){
                    return Image.network(_imageUrls[index],fit: BoxFit.fill);
                  },
                  pagination: SwiperPagination(),  //现实指示器
                ),
              )
            ]
        )
      ),
    );
  }

}