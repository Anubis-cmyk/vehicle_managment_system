import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/single_vehicle.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);
  @override
  _VehiclePageState createState() => _VehiclePageState();
}
class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    // Initialize FlutterFire
    Firebase.initializeApp();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar :  AppBar(
          elevation: 5.0,
          title:   TextButton(
            child: const Text(
            "Enter vehicle number to search .. ",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15
            ))
           , onPressed: () { showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );},
          ),
          backgroundColor: Colors.white70,
          actions:  [
            IconButton(
              icon:(const Icon(Icons.search)),
              color: Colors.black38,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            )
        ),
          body:Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 4,right: 4),
            child:  Container(
                decoration:  BoxDecoration(
                  boxShadow:const [BoxShadow(blurRadius: 6.0,color: Colors.blueGrey)],
                  color: Colors.blueAccent.withOpacity(0.8),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                    top: Radius.circular(15),
                  ),
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:StreamBuilder<List<Vehicle>>(
                    stream: readVehicles(),
                    builder: (context,snapShot){
                      if(snapShot.error != null){
                        return Text('Something went wrong ! ${snapShot.error.toString()}');
                      }else if(snapShot.hasData){
                        final vehicles = snapShot.data;
                        return GridView.count(
                          crossAxisCount: 2,
                          children: vehicles!.map((vehicle) => buildVehicle(vehicle,context)).toList(),
                        );
                      }else{
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                    }
                ),
              ),
            ),
          ),
      ),
    );
  }
}

Widget buildVehicle(Vehicle vehicle, BuildContext context) =>TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SingleVehiclePage(id :vehicle.id)),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
          top: Radius.circular(10),
        ),
        color: Colors.white70,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text(vehicle.departmentNumber),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Image.asset('assets/images/img_hero.png'),
            ),
            Text(vehicle.vehicleNumber),
          ],
        ),
      ),
    ),
  ),
);


class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = [
    '1213',
    '2e432',
    '3qweqw',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) =>
      [
        IconButton(onPressed: () {
          query.isEmpty ? close(context, null) : query = '';
        },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) =>
      Center(
        child: Text(
          query,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },);
  }

}
Stream<List<Vehicle>>readVehicles() =>FirebaseFirestore.instance
    .collection('vehicles')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) =>
          Vehicle.fromJson( doc.data())).toList());
