import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:"Nunito"
    ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            child: LoginPage(),
          ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;
  var _backgroundColor =Colors.white;
  var _headingColor = Color(0xFFB40284A);


  double _headingTop = 100;
  double _loginWidth = 0;
  double _loginYOffset =0;
  double _registerYOffset =0;
  double _loginXOffset = 0;

  double windowWidth =0;
  double windowHeight = 0;
  double _loginOpacity =1;

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch(_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _loginWidth = windowWidth;
        _headingTop = 100;

        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginOpacity =1;

        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _loginYOffset = windowHeight;
        _headingTop = 90;

        _loginYOffset = 270;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginOpacity =1;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _loginWidth = windowWidth - 40;
        _headingTop = 80;

        _loginYOffset = 240;
        _loginXOffset = 20;
        _registerYOffset = 270 ;
        _loginOpacity =0.7;

        break;
    }

    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
          ),

          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap:(){
                  setState(() {

                    _pageState=0;
                  });
                  },
                child: Container(
                    child: Column(
                      children: <Widget>[
                    AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(
                          milliseconds: 1000
                      ),
                          margin: EdgeInsets.only(
                              top: _headingTop,
                          ),
                          child: Text(
                              "Learn Free",
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 28
                          ),
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.all(22),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                              "We make learning easy. Join Tvac Studio to learn flutter for free on YouTube.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32
                ),
                child:Center(
                  child:  Image.asset("assets/images/splash_bg.png"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap:(){
                    setState(() {
                     if(_pageState != 0){
                        _pageState = 0;
                     } else
                        _pageState =1;
                        });
                 },
                  child:  Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFB40284A),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                        child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                        ),
                    ),
        ),
                ),
              ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState=2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(20),
              width: _loginWidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
            ),

          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
           decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
               borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)

          )
                ),
              child:Column(
                children: [
                  PrimaryButton()
                ],
    ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState=1;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(30),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                  milliseconds: 1000
              ),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)

                  )
              ),
    child:Column(
    children: [
      SeondaryButton()
    ],
    ),
          ),
        )
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {



  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFB40284A),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),

      child: Center(
        child: Text(
            "Login",
            style: TextStyle(
            color: Colors.white,
            fontSize: 14
           ),
        ),
      ),
    );
  }
}

class SeondaryButton extends StatefulWidget {
  @override
  _SeondaryButtonState createState() => _SeondaryButtonState();
}

class _SeondaryButtonState extends State<SeondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB40284A),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),

      child: Center(
        child: Text(
          "Create Account",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {
  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
