import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 24.0),
                  decoration: kTextFieldInput,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 12),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                    textAlign: TextAlign.start,
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 35.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                        color: Color(0xFF203fb5),
                      ),
                      Text(
                        "Go Back",
                        style: kBackButtonTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
/*(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),*/
/*Container(
                        margin: EdgeInsets.only(right: 55),
                        child: Icon(
                          Icons.arrow_back,
                          size: 50,
                        ),
                      ),*/
