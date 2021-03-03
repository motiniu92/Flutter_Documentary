import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("My Appbar"),
      ),

      drawer: HomeDrawer(),

    );
  }
}
class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(

        child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(children: <Widget>[
              ListTile(
                dense: true,
                title: Text("Home", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.home),
                onTap: (){Navigator.pushNamed(context, "/home");},
              ),
              ListTile(
                dense: true,
                title: Text("Profile", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.person),
                onTap: (){},
              ),
              ListTile(
                title: Text("Notifications", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.notifications),
                onTap: (){
                  Navigator.pushNamed(context, "/notifications");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Settings", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.settings),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),

            ],),
          ),
        ]
    )
    );
  }
}