import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double latitudeInfo = 0.0;
  double longitudeInfo = 0.0;

  Future<void> getLocation() async {
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeInfo = double.parse(konum.latitude.toStringAsFixed(3));
      longitudeInfo = double.parse(konum.longitude.toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Info App",),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Latitude Info : $latitudeInfo",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Longitude Info : $longitudeInfo",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text("Get Location"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
              onPressed: () {
                getLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
