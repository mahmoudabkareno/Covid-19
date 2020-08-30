import 'dart:convert';

import 'package:covid19_app/UI/Countries.dart';
import 'package:covid19_app/UI/Home1.dart';
import 'package:covid19_app/UI/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Cases.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home>{

  //**************************function to change value of bottomnavigationbar**********
  int _onpressValue = 0;
  void onTapBTN(int value){
    setState(() {
      _onpressValue = value;
    });
  }
  //**************************function to return class widgit**********
  Widget _all(int i){
    switch(i){
      case 0:
        return Home1();
        break;
      case 1:
        return Search();
        break;
      case 2:
        return Countries();
        break;
    }
  }
  List<Cases> _list = [];
  List<Cases> _search = [];
  List<Cases> filteredUsers = List();
  List<Cases> users = List();
  TextEditingController _controllerSearch =new TextEditingController();

  var loading = false;
  Future<Map> getData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final String uri = 'https://api.covid19api.com/summary?fbclid=IwAR0jVY3KcJUfhRi8n15gL3W5ZSYpjvPouHwYqQjaor2Yc8ZUEPRaE1rOOKA';
    Response response = await get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Cases.formJson(i));
          loading = false;
        }
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getData().then((usersFromServer) {
      setState(() {
        users = usersFromServer as List<Cases>;
      });
    });
  }
  Icon cusicon = Icon(Icons.search);
  Widget MyTitle = Text('COVID-19');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: cusicon,
            onPressed: (){
              setState(() {
                if(MaterialPageRoute(builder: (Context) => Home1()) != null){
                  if(this.cusicon.icon == Icons.search){
                    this.cusicon = Icon(Icons.cancel);
                    this.MyTitle = new TextField(
                      onChanged: (string) {
                        setState(() {
                          filteredUsers = users
                              .where((u) => (u.Countries
                              .contains(string.toLowerCase()) ||
                              u.Countries.contains(string.toLowerCase())))
                              .toList();
                        });
                      },
                      controller: _controllerSearch,
                      cursorColor: Colors.white,
                      autocorrect: true,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 30.0),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          hintText: 'Search Counteries',
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.lightBlue),
                          fillColor: Colors.white),
                    );
                  }else{
                    cusicon = Icon(Icons.search);
                    MyTitle = Text('COVID-19');
                  }
                }
              });
            }
        ),
        title: MyTitle,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[

        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: _all(_onpressValue),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _onpressValue,
        onTap: onTapBTN,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: new Icon(Icons.ac_unit),title: Text("New Cases")),
          BottomNavigationBarItem(icon: new Icon(Icons.flag),title: Text("All Countries")),
        ],
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

}