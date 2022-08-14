import 'package:flutter/material.dart';
import 'running.dart';
import 'ideal.dart';
import 'rapier.dart';

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({Key? key}) : super(key: key);
  @override
  _VehicleListPageState createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  @override
  Widget build(BuildContext context)  => DefaultTabController(length: 3,
      child:Scaffold(
          appBar: AppBar(
            title: const Text('Vehicle management system',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Running',),
                Tab(text: 'Ideal',),
                Tab(text: 'Rapier',)
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 172, 22, 74),
                            Color.fromARGB(255, 121, 20, 55)
                          ],
                        )),

                ),
              ),

            ],
            backgroundColor: Colors.transparent,
            elevation: 0.1,

          ),
          body: TabBarView(
            children: [
              Center(child: RunningVehiclePage()),
              Center(child: IdealVehiclePage()),
              Center(child: RapierVehiclePage()),
            ],
          )
      )
  );
}
