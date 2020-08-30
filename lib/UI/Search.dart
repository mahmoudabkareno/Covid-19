import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SearchState();
  }
}

class SearchState extends State<Search> {
  TextEditingController _controllerSearch = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        new Image.asset(
          "images/crona.png",
          fit: BoxFit.fill,
          height: 300.0,
          width: 430.0,
        ),
        new Container(
          margin: EdgeInsets.only(top: 320.0),
          child: getWidgit(),
        ),
      ],
    );
  }

  Future<Map> getData() async {
    String uri =
        'https://api.covid19api.com/summary?fbclid=IwAR0jVY3KcJUfhRi8n15gL3W5ZSYpjvPouHwYqQjaor2Yc8ZUEPRaE1rOOKA';
    Response response = await get(uri);
    return json.decode(response.body);
  }

  Widget getWidgit() {
    // ignore: missing_return
    return new FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
          if (snapShot.data != Null) {
            Map content = snapShot.data;
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                ),
              );
            }
            return new Container(
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Corona World News",
                    style: TextStyle(
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                        fontSize: 30.0),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(left: 80.0, top: 100.0)),
                      new Image.asset(
                        "images/newconfirmed.png",
                        fit: BoxFit.fill,
                        height: 50.0,
                        width: 50.0,
                      ),
                      new Padding(padding: EdgeInsets.only(left: 50.0)),
                      new Image.asset(
                        "images/newdeaths.png",
                        fit: BoxFit.fill,
                        height: 50.0,
                        width: 50.0,
                      ),
                      new Padding(padding: EdgeInsets.only(left: 50.0)),
                      new Image.asset(
                        "images/newrecovered.png",
                        fit: BoxFit.fill,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(left: 80.0, top: 20.0)),
                      new Text(
                        "${content['Global']['NewConfirmed']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text(
                        "${content['Global']['NewDeaths']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text(
                        "${content['Global']['NewRecovered']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(left: 80.0, top: 20.0)),
                      new Text(
                        "Confirmed",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text(
                        "Deaths",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text(
                        "Recovered",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return new Text(
              // ignore: missing_return, missing_return
              "Please Connect to Internet",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            );
          }
        });
  }
}
