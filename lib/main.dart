import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smconfapp/screens/home.dart';
import 'package:smconfapp/utils/constants.dart';
import 'package:smconfapp/widgets/speaker_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'SMConf 2021',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeGreen
      ),
      home: MyHomePage(title: 'SMConf 2021'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(
              middle: Text(tabs[index].title),
            ),child:buildLayout(index) );
          },
        );
      
    }, tabBar: CupertinoTabBar(
      items: tabs.map((tab) => BottomNavigationBarItem(icon: Icon(tab.icon))).toList(),
    ),
      
    );
  }

  Widget buildLayout(int index) {
    Widget widget = Container();
    switch(index){
      case 0:{
        widget = Home();
      }
      break;

      case 1:{
        widget = SpeakersList();
      }
      break;
      case 2:{
        widget = SpeakersList();
      }
      break;
      default:{
        widget = Container();
      }
    }
    return widget;
  }
}

class SpeakersList extends StatelessWidget {
  const SpeakersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return SpeakerItem();
    },
        separatorBuilder: (context,index)=> Divider(height: 2,),
        itemCount: 30);
  }
}

