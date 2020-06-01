import 'package:flutter/material.dart';
import 'package:placesapp/providers/places.dart';
import 'package:placesapp/screens/new_place.dart';
import 'package:placesapp/screens/places.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesScreen(),
        routes: {
          NewPlaceScreen.routeName: (ctx) => NewPlaceScreen(),
        },
      ),
    );
  }
}
