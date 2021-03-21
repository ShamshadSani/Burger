import 'package:burger/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}



class SplashScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {

    return SplashScreenState();

  }
}
const TextStyle textStyle = TextStyle(
  color: Colors.white,
);
class SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {


  AnimationController controller;
  Animation<double> animation;

//  onDoneLoading() async {
//    Navigator.of(context).push(
//        MaterialPageRoute(builder: (context) => PhVerification()));
//  }
//  Future<Timer> loadData() async {
//    return new Timer(Duration(seconds: 5), onDoneLoading);
//  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
    controller = AnimationController(
        duration: Duration(milliseconds: 4000),
        vsync: this
    );


    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent:controller, curve: Curves.easeInOutCirc
    ));


    controller.forward();
  }



  final background = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('image/splash.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );

  final greenOpacity = Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color(0xFF004E75),
          Color(0xFF1385bd),
        ])),
  );



  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
//    ]);

    final logo = new ScaleTransition(
      scale: animation,
      child: Text(
        "BASSEL",
        style: TextStyle(fontSize: 30),
      ),
    );

    final description1 = new FadeTransition(
      opacity: animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(-0.0,-300.0, ), end: Offset.zero)
            .animate(CurvedAnimation(
            parent:controller, curve: Curves.fastLinearToSlowEaseIn
        )),
        child:  Image.asset(
          'images/BO3.png',
          width: 180.0,
          height: 180.0,
          fit: BoxFit.fill,
        ),
      ),
    );
    final description = new FadeTransition(
      opacity: animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(-0.0,10.0, ), end: Offset.zero)
            .animate(CurvedAnimation(
            parent:controller, curve: Curves.easeInOutSine
        )),
        child: Image.asset(
          'images/BO3B.png',
          width: 180.0,
          height: 180.0,
          fit: BoxFit.fill,
        ),
      ),
    );
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          //greenOpacity,
          //background,

          new SafeArea(
            child: new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // logo,
                  description1,
                  logo,
                  description,
                  SizedBox(height: 60.0),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

