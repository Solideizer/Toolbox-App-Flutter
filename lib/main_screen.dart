import 'package:flutter/material.dart';
import 'package:flutter_toolbox/calculator.dart';
import 'package:flutter_toolbox/todoUI.dart';
import 'package:flutter_toolbox/galleryPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "Toolbox",
                        style: TextStyle(
                          fontSize: 72.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoPage()));
                        },
                        child: Text(
                          "Todo",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.black,
                        splashColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        )),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalculatorPage()));
                        },
                        child: Text(
                          "Calculator",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.black,
                        splashColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        )),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryPage()));
                        },
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22.0,
                          ),
                        ),
                        color: Colors.black,
                        splashColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
