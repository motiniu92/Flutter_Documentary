import 'package:flutter/material.dart';
import 'package:my_works/pageView/pageViewScreen.dart';

import 'first/drawerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),


      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                             builder: (context) => DrawerExample(),
                        ),
                     );
                  },
                  child: Text("Save"),
                ),

                SizedBox(width: 10,),
                RaisedButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                             builder: (context) => PageViewScreen(),
                        ),
                     );
                  },
                  child: Text("PageView"),
                ),
              ],
            ),


            Text(
            "Hello world",
              style: TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold,
              )
            ),
          ],
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
