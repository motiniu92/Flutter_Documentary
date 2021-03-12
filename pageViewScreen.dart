import 'package:flutter/material.dart';


class PageViewScreen extends StatefulWidget {

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

// Page One
class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Web View',
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
      body: Column(
        children: <Widget>[
          Row(
            children: [
              MyBox(Colors.redAccent, height: 50),
            ],
          ),
          Row(
            children: [
              MyBox(lightBlue),
              MyBox(Colors.lightGreenAccent),
            ],
          ),
          MyBox(mediumGreen, text: 'PageView 1',),

          Row(
            children: [
              MyBox(Colors.yellow, height: 200),
              MyBox(Colors.purple, height: 200),
            ],
          ),
        ],
      ),
    );
  }
}

// Page Two
class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Web View',
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
      body: Column(
        children: <Widget>[
          Row(
            children: [
              MyBox(Colors.deepPurple, height: 50),
              MyBox(Colors.red, height: 50),
            ],
          ),
          Row(
            children: [
              MyBox(Colors.orange),
              MyBox(Colors.green),
            ],
          ),
          MyBox(mediumBlue, text: 'PageView 2'),
          Row(
            children: [
              MyBox(Colors.grey),
              MyBox(Colors.lime),
            ],
          ),
        ],
      ),
    );
  }
}

// Page Three
class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Web View',
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
      body: Column(
        children: <Widget>[
          Row(
            children: [
              MyBox(Colors.grey),
              MyBox(Colors.greenAccent),
            ],
          ),
          MyBox(mediumRed, text: 'PageView 3'),
          Row(
            children: [
              MyBox(Colors.yellow),
              MyBox(Colors.blue),
              MyBox(Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;



class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}