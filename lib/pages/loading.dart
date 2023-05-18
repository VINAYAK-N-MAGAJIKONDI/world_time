import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupworldtime() async {



    WorldTime instnce = WorldTime(location: 'India', flag: 'india.png',  url: 'Asia/Kolkata');
    await instnce.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instnce.location,
      'flag': instnce.flag,
      'time': instnce.time,
      'isDay': instnce.isDay,
    });

  }
  @override
  void initState() {
    super.initState();
    setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SpinKitWave(
          itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
    decoration: BoxDecoration(
    color: index.isEven ? Colors.red : Colors.blueAccent,
    ),
    );
    },
    ),
      ), backgroundColor: Colors.greenAccent,
    );
  }
}
