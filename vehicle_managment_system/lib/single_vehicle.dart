
import 'package:flutter/material.dart';


class SingleVehiclePage extends StatefulWidget {
  SingleVehiclePage({Key? key}) : super(key: key);
  @override
  _SingleVehiclePageState createState() => new _SingleVehiclePageState();
}

class _SingleVehiclePageState extends State<SingleVehiclePage> {
  @override
  Widget build(BuildContext context) {
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
             child: Column(
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
                           Text('Vehicle Number',style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                           ),),
                           Text('00000',style: TextStyle(
                             letterSpacing: 5,
                             fontWeight: FontWeight.w400,
                             fontSize: 20,
                           ),),
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: 8.0),
                             child: Container(
                                 decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.red,
                                        width: 3.0,
                                      ),
                                    ),
                                 ),
                                 child: Text(' data ',style: TextStyle(
                                   letterSpacing: 4,
                                   color: Colors.white,
                                   fontWeight: FontWeight.w300,
                                   fontSize: 18,
                                 ),)),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Department number : '),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Registraion number : '),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Modal :'),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Oparator Name :'),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Oparating weigth :'),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('onsumption'),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Currunt Division :'),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Remark : '),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   );
  }
}
