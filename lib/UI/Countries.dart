import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Countries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CountriesState();
  }
}

class CountriesState extends State<Countries> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.greenAccent,
      child: getWidgit(),
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
        builder: (BuildContext context,
            AsyncSnapshot<Map> snapShot) {
          if (snapShot.hasData) {
            Map content = snapShot.data;
            return new ListView.builder(
                itemCount: 186,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    color: Colors.deepPurple,
                      child: new ListTile(
                        // ignore: missing_return
                        onLongPress: (){
                          if (!snapShot.hasData) {
                            return Center(
                              // ignore: missing_return
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
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
                                        color: Colors.limeAccent, fontSize: 20.0),
                                  ),
                                ],
                              ),
                              FlatButton(
                                child: new Icon(
                                  Icons.slideshow,
                                  color: Colors.white,
                                  size: 49.0,
                                ),
                                onPressed: () {
                                  showMyDialog(
                                      context,
                                      '${content['Countries'][index]['Country']}',
                                      '${content['Countries'][index]['NewConfirmed']}',
                                      '${content['Countries'][index]['TotalConfirmed']}',
                                      '${content['Countries'][index]['NewDeaths']}',
                                      '${content['Countries'][index]['TotalDeaths']}',
                                      '${content['Countries'][index]['NewRecovered']}',
                                      '${content['Countries'][index]['TotalRecovered']}',
                                      '${content['Countries'][index]['Date']}');
                                },
                                padding: EdgeInsets.only(left: 200.0),
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
                    onTap: (){showMyDialog(context,
                        '${content['Countries'][index]['Country']}',
                        '${content['Countries'][index]['NewConfirmed']}',
                        '${content['Countries'][index]['TotalConfirmed']}',
                        '${content['Countries'][index]['NewDeaths']}',
                    '${content['Countries'][index]['TotalDeaths']}',
                    '${content['Countries'][index]['NewRecovered']}',
                    '${content['Countries'][index]['TotalRecovered']}',
                        '${content['Countries'][index]['Date']}');}
                      )
                  );
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

  Future<Null> showMyDialog(
      BuildContext context,
      String value1,
      String value2,
      String value3,
      String value4,
      String value5,
      String value6,
      String value7,
      String value8) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: new Text(
            'Countery: $value1',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.deepPurple,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'New Confirmed:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value2',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'Total Confirmed:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value3',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'New Deaths:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value4',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'Total Deaths:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value5',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'New Recovered:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value6',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'Total Recovered:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value7',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: 20.0)),
                    new Text(
                      'Date:  ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      '$value8',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.deepPurple,
            ),
          ],
        );
      },
    );
  }
}
