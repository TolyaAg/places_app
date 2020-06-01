import 'package:flutter/material.dart';
import 'package:placesapp/screens/new_place.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(NewPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false).getPlaces(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
          return Consumer<PlacesProvider>(
            builder: (ctx, places, _) {
              if (places.items.length > 0) {
                return ListView.builder(
                  itemCount: places.items.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (ctx, i) {
                    final place = places.items[i];
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(place.image),
                          ),
                          title: Text(place.title),
                          onTap: () {},
                        ),
                        Divider(
                          height: 0,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: const Text('No places yet!'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
