import 'package:covid19_app/UI/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  void _nextStep(){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Home()
        )
    );
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(
      seconds: 2
    ),_nextStep
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            "images/splash.jfif",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          new Container(
            margin: EdgeInsets.only(top: 40.0),
            child: new ListTile(
              title: Text(
                "COVID-19",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0),
              ),
              subtitle: Text(
                "Discoverd New Cases",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

