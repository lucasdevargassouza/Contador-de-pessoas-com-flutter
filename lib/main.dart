import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Contador de pessoas",
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infotext = "Pode entrar!";
  int _pessoas = 0;

  void changePeaple(int delta) {
    if (_pessoas >= -1 && _pessoas <= 11) {
      _pessoas += delta;
      _infotext = "Pode entrar!";
      if (_pessoas < -1) {
        _pessoas = -1;
      } else if (_pessoas > 11) {
        _pessoas = 11;
      }
    }

    if (_pessoas <= -1) {
      _infotext = "Mundo invertido?!";
    }

    if (_pessoas >= 11) {
      _infotext = "Lotado!";
    }

    setState(() {
      _pessoas = _pessoas;
      _infotext = _infotext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "lib/assets/imgs/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_pessoas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      onPressed: () {
                        changePeaple(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      onPressed: () {
                        changePeaple(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _infotext,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
