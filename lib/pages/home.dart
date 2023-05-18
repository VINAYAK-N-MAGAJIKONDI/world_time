import 'package:flutter/material.dart';


class home extends StatefulWidget {


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bgimage = data['isDay'] ? 'OIPp.jpg' : 'night.jpg';

    return Scaffold(
      body: SafeArea(child: Container( decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/$bgimage'),
      fit: BoxFit.cover,
      )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit_location , color: Colors.blue,),
                  MaterialButton(onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                    data = { 'time' : result['time'],
                    'location': result['location'],
                    'flag': ['flag'],
                    'isDay': result['isDay'],};

                    });

                  }, child: Text('Edit location'))
                ],
              ),
              SizedBox(height: 20.0,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data['location'],style: TextStyle(
                fontSize: 28.0, letterSpacing: 2.0
              ),)
            ],
    ),
              SizedBox(height: 20.0,),
              Text(data['time'],style: TextStyle(
                  fontSize: 66.0, letterSpacing: 2.0
              ),)


            ],
          ),
        ),
      )),


    );
  }
}
