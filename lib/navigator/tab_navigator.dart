
import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';


class TabNavigator extends StatefulWidget {
  //_TabNavigatorState定义好后，就可以修改该函数的返回值进行返回
  @override
  _TabNavigatorState createState() =>  _TabNavigatorState();
}


////在dart里面，如果要定义一个内部类，不能被外部访问的话，就可以以下划线开头
//_TabNavigatorState  只能被当前文件使用
class _TabNavigatorState extends State<TabNavigator> {

  final _defaultColor = Colors.grey;  //默认未选择颜色
  final _activeColor = Colors.blue;   //选择颜色
  int _currentIndex = 0;              //当前选中Index
  final PageController _controller = PageController(
    initialPage: 0,//初始状态下打开第0个tab
  );

  @override
  Widget build(BuildContext context) {//在build（）方法里面，可以将Scaffold（）作为整个页面的根节点
    return Scaffold(
      ////body中定义一个PageView
      body: PageView(
        //pageview中使用一个controller
          controller:_controller,
          //要显示的页面
          //需要显示“首页”、“搜索”、“旅拍”、“我的”
          children :<Widget> [
              HomePage(),
              SearchPage(),
              TravelPage(),
              MyPage()
          ]
      ),

        bottomNavigationBar:BottomNavigationBar(
          //默认当前的界面
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,      //设置图标和文字一起变化
            onTap: (index) {
              //跳到选中的界面
              _controller.jumpToPage(index);
              setState(() {
                _currentIndex=index;
              });
            },

            items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: _defaultColor),
              activeIcon: Icon(Icons.home,color: _activeColor),
              title:Text('首页',style: TextStyle(color: _currentIndex!=0?_defaultColor:_activeColor),)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: _defaultColor,),
              activeIcon: Icon(Icons.search,color: _activeColor,),
              title:Text('搜索',style: TextStyle(color: _currentIndex!=1?_defaultColor:_activeColor),)

          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt,color: _defaultColor,),
              activeIcon: Icon(Icons.camera_alt,color: _activeColor,),
              title:Text('旅拍',style: TextStyle(color: _currentIndex!=2?_defaultColor:_activeColor),)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,color: _defaultColor,),
              activeIcon: Icon(Icons.account_circle,color: _activeColor,),
              title:Text('我的',style: TextStyle(color: _currentIndex!=3?_defaultColor:_activeColor),)
          ),

        ])
    );
  }

}