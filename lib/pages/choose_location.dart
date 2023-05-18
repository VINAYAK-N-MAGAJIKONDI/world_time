import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({Key? key}) : super(key: key);

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png',  )
  ];

void updateTime(index) async {
  WorldTime instnce = locations[index];
  await instnce.getData();
  //navigate to home screen
  Navigator.pop(context, {
    'location': instnce.location,
    'flag': instnce.flag,
    'time': instnce.time,
    'isDay': instnce.isDay,

  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Choose location'),
          centerTitle: true,
          elevation: 0,
        ),
    body: ListView.builder(itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0 ,horizontal: 4.0),
        child: Card(
          child: ListTile(
            onTap: (){
              updateTime(index);
            },
              title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        ),
      );

    },

    itemCount: locations.length,

    )


    );
  }
}
