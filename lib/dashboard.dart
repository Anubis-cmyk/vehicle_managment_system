import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_managment_system/EditVehicle.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/addVehicle.dart';
import 'package:vehicle_managment_system/single_vehicle.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              width: 230,
              height: 45,
              child: Card(
                child: TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddVehiclePage()),
              );
            }, child: Text('Add'))
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.1,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('vehicles')
            .where("vehicleNumber", isGreaterThanOrEqualTo: name)
            .where('vehicleNumber', isLessThan: name +'z')
            .snapshots()
            : FirebaseFirestore.instance.collection("vehicles").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 24,
              // width / height: fixed for *all* items
              childAspectRatio: 0.50,
            ),itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
              return Card(
                margin: const EdgeInsets.all(10),
                shadowColor: Colors.black38,
                child: Container(
                    decoration: const BoxDecoration(
                    boxShadow: [
                    BoxShadow(blurRadius: 1.0, color: Colors.white70)
                    ],
                    ),
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SingleVehiclePage(id : data['id'].toString())),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['vehicleNumber'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                              color: Colors.blue
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Icon(Icons.electric_car, size: 40,color: Colors.grey,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            data['state'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,color: Colors.grey
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                               'Department number',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,color: Colors.lightBlue
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                data['departmentNumber'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,color: Colors.black54
                                  ),
                                ),
                              ),
                              Text(
                                'Division : ' + data['division'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,color: Colors.lightBlue
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Type  : ' + data['type'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,color: Colors.lightBlue
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Modal  : ' + data['modal'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,color: Colors.lightBlue
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueAccent, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    onPressed: () {
                                      Vehicle vehicle = Vehicle(
                                          id: data['id'],
                                          vehicleNumber: data['vehicleNumber'],
                                          departmentNumber: data['departmentNumber'],
                                          registrationNumber: data['registrationNumber'],
                                          division: data['division'],
                                          modal: data['modal'],
                                          type: data['type'],
                                          state: data['state'],
                                          oparatorName: data['oparatorName'],
                                          oparatingWeight: data['oparationWeight'],
                                          consumption: data['consumption'],
                                          remark: data['remark']);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  EditVehiclePage(vehicle: vehicle)),
                                      );
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    onPressed: () {
                                      showAlertDialog(context, data['id']);
                                    },
                                    child: Icon(Icons.delete),
                                  )
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

}

showAlertDialog(BuildContext context,String id) {
  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Cancle"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget cancelButton = TextButton(
    child: Text("Delete"),
    onPressed:  () {
      final docUser = FirebaseFirestore.instance.collection('vehicles').doc(id);
      docUser.delete();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("remove vehicle details"),
    content: Text("Are you sure?"),
    actions: [
      remindButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}