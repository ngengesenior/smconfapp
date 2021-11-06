import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/sample_data/sample_data.dart';
import 'package:smconfapp/screens/home.dart';
import 'package:smconfapp/screens/map.dart';
import 'package:smconfapp/screens/schedule.dart';
import 'package:smconfapp/utils/app_color.dart';
import 'package:smconfapp/widgets/speaker_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(SMConfApp());
}

class SMConfApp extends StatefulWidget {
  const SMConfApp({Key? key}) : super(key: key);

  @override
  _SMConfAppState createState() => _SMConfAppState();
}

class _SMConfAppState extends State<SMConfApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder:
        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

      if (snapshot.hasError) {
        return Center(child: Text("Something went wrong"),);
      }

      // Once complete, show your application
      if (snapshot.connectionState == ConnectionState.done) {
        return MyApp();
      }

      // Otherwise, show something whilst waiting for initialization to complete
      return Center(child: CircularProgressIndicator(),);
    },future: _initialization,);
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'The Showcase',
      theme: ThemeData(
        primarySwatch: mainColor,
        textTheme: GoogleFonts.ralewayTextTheme()
      ),
      home: MyHomePage(title: 'The Showcase'),
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

  var _selectedIndex = 0;
  PageController _pageController = PageController();

  /*@override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              middle: Text(tabs[index].title),
            ),child:buildLayout(index) );
          },
        );
      
    }, tabBar: CupertinoTabBar(
      items: tabs.map((tab) => BottomNavigationBarItem(icon: Icon(tab.icon))).toList(),
    ),
      
    );
  }*/

  Widget buildLayout(int index) {
    Widget widget = Container();
    switch(index){
      case 0:{
        widget = Home();
      }
      break;

      case 1:{
        widget = ScheduleScreen();
      }
      break;
      case 2:{
        widget = SpeakersList();
      }
      break;
      default:{
        widget = MapWidget();
      }
    }
    return widget;
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Home(),
          ScheduleScreen(),
          SpeakersList(),
          MapWidget()
        ],

      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label: "Agenda"),
          BottomNavigationBarItem(icon: Icon(Icons.group),label: "Group"),
          BottomNavigationBarItem(icon: Icon(Icons.map),label: "Map")

        ],
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        onTap: onTap,
      ) ,

    );
  }
}

class SpeakersList extends StatelessWidget {
  const SpeakersList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return SpeakerItem(speaker: speaker1,);
    },
        separatorBuilder: (context,index)=> Divider(height: 2,),
        itemCount: 30);
  }
}

