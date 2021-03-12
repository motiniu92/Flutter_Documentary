import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonVisibilityScreen extends StatefulWidget {
  @override
  _ButtonVisibilityScreenState createState() => _ButtonVisibilityScreenState();
}

class _ButtonVisibilityScreenState extends State<ButtonVisibilityScreen> {
  bool widgetVisible = true;

  void showWidget() {
    setState(() {
      widgetVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      widgetVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Button Visibility',
              style: TextStyle(
                  color: Colors.black
              ),),
            ),

            backgroundColor: Colors.white,
            elevation: 1,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProfileScreen()));
                }
                ),
          ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: widgetVisible,
                      child: Container(
                        height: 200,
                        width: 300,
                        color: Colors.redAccent,
                        margin: EdgeInsets.only(top: 20, bottom: 60),
                        child: Center(

                            child: Text('Show Hide View Container Widget in Flutter',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold)
                            )
                        )
                    )
                ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     RaisedButton(
                       child: Text('Hide Button'),
                       onPressed: hideWidget,
                       color: Colors.green,
                       textColor: Colors.white,
                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                     ),
                     SizedBox(width: 10,),
                     RaisedButton(
                       child: Text('Show Button'),
                       onPressed: showWidget,
                       color: Colors.blue,
                       textColor: Colors.white,
                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                     ),
                   ],
                 ),

               ],
              ),
            ),
        )
    );
  }
}
