import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MyApp());

  // References Links : ( https://www.kindacode.com/article/how-to-read-local-json-files-in-flutter/ )
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List _list = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsonFile/countryList.json');
    final data = await json.decode(response);
    setState(() {
      _list = data["countryList"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Load Data',
              ),
              onPressed: readJson,

            ),

            // Display the data loaded from sample.json
            _list.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(_list[index]["name"]),
                            title: Text(_list[index]["code"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
