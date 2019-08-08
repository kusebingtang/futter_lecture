# flutter_trip

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# flutter_lecture

#### 轮播图Banner功能的开发
* pubspec.yaml config flutter_swiper 插件
```jshelllanguage
flutter_swiper : ^1.1.6
```

##### 自定义AppBar实现滚动渐变
* 移除listview和顶部的padding
需要用到一个类，这个类是**MediaQuery**

* 监听列表的滚动
在flutter里面监听列表的滚动需要用到一个类：**NotificationListener()**

* 实现一个AppBar，可以悬浮在上面
Opacity() 动态修改opacity的值，来修改透明度