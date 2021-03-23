import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  List<HostelData> hotels = [];

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

  ///============================

  //StreamSubscription<DataConnectionStatus> listener;
  //var Internetstatus = "Unknown";

  Future<DataConnectionStatus> checkInternet() async {
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");

    print("Last results: ${DataConnectionChecker().lastTryResults}");

    return await DataConnectionChecker().connectionStatus;
  }

  // void showToast() {
  //   Fluttertoast.showToast(
  //       msg: 'You are connected',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIos: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white);
  // }

  void showToast() {

    Fluttertoast.showToast(
        msg: "No Internet ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.red,
        timeInSecForIos: 1
    );
  }

//==================

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getHotelListJsonData();

    checkInternet().then((value) => callData(value));

    //  listener  =  checkInternet()
    //   listener = checkInternet().onStatusChange.listen((status) {
    //     switch (status) {
    //       case DataConnectionStatus.connected:
    //
    //         Internetstatus = "Connectd TO THe Internet";
    //         print('Data connection is available.');
    //
    //         getHotelListJsonData();
    //         setState(() {
    //           showToast();
    //         });
    //         break;
    //       case DataConnectionStatus.disconnected:
    //         Internetstatus = "No Data Connection";
    //         print('You are disconnected from the internet.');
    //         setState(() {
    //           showToast2();
    //         });
    //         break;
    //     }
    //   });
    //showToast();
    setState(() {
      // hotels = _hotelList.response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body:  ListView.builder(
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
                                                  Text(hotels[index].payarr,
                                                  ),
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

  callData(DataConnectionStatus status) {

    if (status == DataConnectionStatus.connected){
      getHotelListJsonData();
    }else {
        showToast();
         noConnection();
         HotelListScreen();
    }

  }

  Widget noConnection() {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Text('Connection Problem'),
          RaisedButton(
              onPressed: (){},
            child: Text('try'),
              )
        ],
      );
  }
}
