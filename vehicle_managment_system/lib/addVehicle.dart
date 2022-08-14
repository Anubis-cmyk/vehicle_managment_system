import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class AddVehiclePage extends StatefulWidget {
  AddVehiclePage({Key? key}) : super(key: key);

  @override
  _AddVehiclePageState createState() {
    return _AddVehiclePageState();
  }
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation = 'Please choose a location';

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        title: const Center(
          child: Text('Add new vehicle',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow:const [BoxShadow(blurRadius: 1.0,color: Colors.black, )],
          color: Colors.blue.withOpacity(0.3),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children:[ Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          labelText: 'Vehicle number',
                          labelStyle: const TextStyle(
                              color: Colors.white
                          ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Department number ',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter department number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Registration number ',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter registration number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                        items: _locations.map((String val) {
                          return  DropdownMenuItem<String>(
                            value: val,
                            child: new Text(val),
                          );
                        }).toList(),
                        hint: const Text("Please choose a division",style: TextStyle(color: Colors.white),),
                        onChanged: (newVal) {
                          _selectedLocation = newVal.toString();
                          setState(() {});
                        }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _locations.map((String val) {
                            return  DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text("Please choose a vehicle modal",style: TextStyle(color: Colors.white),),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {});
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _locations.map((String val) {
                            return  DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text("Please choose a vehicle type ",style: TextStyle(color: Colors.white),),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {});
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _locations.map((String val) {
                            return  DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text("Please choose a vehicle state ",style: TextStyle(color: Colors.white),),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {});
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Operator Name',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter operator Name :';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Operating weight',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter operating weight :';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Consumption',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter consumption :';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,//Normal textInputField will be displayed
                      maxLines: 5,// when user presses enter it will adapt to it
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Remark',
                        labelStyle: const TextStyle(
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Remark :';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ]
          ),
        ),
      ),
    );
  }
}