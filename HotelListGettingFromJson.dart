import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'example/HotelListScreen.dart';
import 'models/hotelListModel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  HotelList _hotelList;
  List<HostelData> hotels;

  Future<String> getHotelListJsonData() async {
    final response = await http
        .get("https://deshitour.com/api/hotels/list?appKey=DeshiTour");
    try {
      if (response.statusCode == 200) {
        _hotelList = HotelList.fromJson(jsonDecode(response.body));

        print("Response Json Data :  ${response.body}");

        hotels = _hotelList.response;
        print("List of Hotels... ${hotels.length}");
        return 'response';
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHotelListJsonData();
    setState(() {
      // hotels = _hotelList.response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, top: 16, right: 12, bottom: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  child: ClipRRect(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1.8,
                              child: Image.network(
                                hotels[index].thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            top: 8,
                                            bottom: 8,
                                            right: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  hotels[index].title ?? "",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  hotels[index].address ?? "",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                SmoothStarRating(
                                                  allowHalfRating: true,
                                                  starCount: 5,
                                                  rating: double.parse(
                                                      hotels[index].starsCount),
                                                  size: 15,
                                                  isReadOnly: true,
                                                  color: Colors.yellow,
                                                  borderColor:
                                                      Colors.amberAccent,
                                                ),
                                                Spacer(),
                                                Text(
                                                  " ${hotels[index].avgReviews.totalReviews ?? "0"} Reviews",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${hotels[index].currCode}: ${hotels[index].price} ${hotels[index].currSymbol}"),
                                                Spacer(),
                                                Text(hotels[index].payarr),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          bottom: 100,
                          child: Container(
                            //height: 26,
                            width: 142,
                            margin: EdgeInsets.only(
                                left: 10.0, top: 16, bottom: 220),
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              ' Welcome ',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  //backgroundColor: Colors.greenAccent[400],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
