import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Cases.dart';

class Home1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Home1State();
  }
}

class Home1State extends State<Home1> {
  var loading = false;
  Future<Map> getData() async {
    final String uri = 'https://api.covid19api.com/summary?fbclid=IwAR0jVY3KcJUfhRi8n15gL3W5ZSYpjvPouHwYqQjaor2Yc8ZUEPRaE1rOOKA';
    Response response = await get(uri);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.lightBlue,
        body: new Container(
          child: getWidgit()
        )
    );
  }

  Widget getWidgit() {
    // ignore: missing_return
    return new FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,
              ),
            );
          }
          if (snapShot.hasData) {
            Map content = snapShot.data;
            return new ListView.builder(
                itemCount: 186,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                      color: Colors.black,
                      child: ListTile(
                        // ignore: missing_return
                        title: new Text(
                          '${content['Countries'][index]['Country']}',
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                        subtitle: new Container(
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'New Confirmed:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['NewConfirmed']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'Total Confirmed:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['TotalConfirmed']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'New Deaths:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['NewDeaths']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'Total Deaths:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['TotalDeaths']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'New Recovered:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['NewRecovered']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'Total Recovered:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['TotalRecovered']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'Date:  ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    '${content['Countries'][index]['Date']}',
                                    style: TextStyle(
                                        color: Colors.limeAccent,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        leading: new CircleAvatar(
                          child: new Text(
                            '${index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.green),
                          ),
                        ),
                      ));
                });
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
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.greenAccent,
            ),
          );
        });
  }
}

