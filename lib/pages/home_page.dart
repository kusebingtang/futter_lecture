import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0.0;
  List _imageUrls=[
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'http://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'http://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
  ];

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(

          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,

                child:  NotificationListener(

                  onNotification:(scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) { //过滤listview的监听以后  scrollNotification.depth==0 找到第一个滚动的子元素
                      //滚动且是列表滚动的时候
                      _onScroll(scrollNotification.metrics.pixels);
                    }

                  },

                  child: Center(
                      child:  ListView(  //使用Listvew 当页面高度大于屏幕高度，可以滑动
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
                            ),

                            Container(
                              height: 800,
                              color: Colors.green,
                              child: ListTile(
                                title: Text('哈哈'),
                              ),
                            )

                          ]
                      )
                  ),
                )
            ),

            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('首页'),
                  ),
                ),
              ),

            ),
          ],
        )

    );
  }

}