
import 'package:flutter/material.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class SingleVehiclePage extends StatefulWidget {
  final String id;
  const SingleVehiclePage({Key? key, required this.id}) : super(key: key);
  @override
  _SingleVehiclePageState createState() => new _SingleVehiclePageState(id);
}

class _SingleVehiclePageState extends State<SingleVehiclePage> {
  final String id;
  _SingleVehiclePageState(this.id);
  @override
  Widget build(BuildContext context) {

    // Initialize FlutterFire
    Firebase.initializeApp();
   return  Scaffold(
      appBar:  AppBar(
        title: const Text('Vehicle management system',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
     body: Stack(
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
           child: Container(
             height: double.infinity,
             decoration: const BoxDecoration(
               borderRadius: BorderRadius.vertical(
                 bottom: Radius.circular(10),
                 top: Radius.circular(10),
               ),
               color: Colors.blue,
               boxShadow:[BoxShadow(blurRadius: 8.0,color: Colors.black38)],
             ),
             child:StreamBuilder<List<Vehicle>>(
                 stream: readVehicles(id),
                 builder: (context,snapShot){
                   if(snapShot.error != null){
                     return Text('Something went wrong ! ${snapShot.error.toString()}');
                   }else if(snapShot.hasData){
                     final vehicles = snapShot.data;
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: vehicles!.map((vehicle) => buildVehicle(vehicle,id,context)).toList(),
                     );
                   }else{
                     return const Center(child: CircularProgressIndicator.adaptive());
                   }
                 }
             ),
                   ),
                 ),
               ],
             ),
           );
  }
}


Widget buildVehicle(Vehicle vehicle,String id, BuildContext context) =>Column(
  children: [
    if(vehicle.id == id)
    Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/img_hero.png'),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children:  [
                        const Text('Vehicle Number',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                        Text(vehicle.vehicleNumber,style: const TextStyle(
                          letterSpacing: 5,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: Text(vehicle.state,style: const TextStyle(
                                letterSpacing: 4,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                              ),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Department number : ' + vehicle.departmentNumber),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Registraion number : '+ vehicle.registrationNumber),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Modal :' + vehicle.modal),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Oparator Name :'+ vehicle.oparatorName),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Oparating weigth :' + vehicle.oparatingWeight),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Consumption : ' + vehicle.consumption),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Currunt Division :' + vehicle.division),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Remark : ' + vehicle.remark),
                        ),
                      ],
                    )
                  ]
              )
          )
        ]
    )
  ]
);


Stream<List<Vehicle>>readVehicles(String id) =>FirebaseFirestore.instance
    .collection('vehicles')
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) =>
        Vehicle.fromJson( doc.data())).toList());
