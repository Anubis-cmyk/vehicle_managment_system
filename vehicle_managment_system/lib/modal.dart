import 'package:flutter/material.dart';

class ModalPage extends StatefulWidget {
  ModalPage({Key? key}) : super(key: key);
  @override
  _ModalPageState createState() => new _ModalPageState();
}
class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar :  AppBar(
            elevation: 5.0,
            title:   TextButton(
              child: const Text(
                  "Enter Modal name to search .. ",
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
                icon:(Icon(Icons.search)),
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
              boxShadow:[BoxShadow(blurRadius: 6.0,color: Colors.blueGrey)],
              color: Colors.blueAccent.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(100, (index) {
                  return TextButton(
                    onPressed: () {  },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 2),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                Center(child: Text("Modal Name")),
                                Padding(
                                  padding: EdgeInsets.only(top: 6,bottom: 6),
                                  child: Center(child: Icon(Icons.electric_car_rounded,size: 40,)),
                                ),
                                Center(child: Text('Vehicles : 0')),
                                Center(child: Text('Running : 0',style: TextStyle(color: Colors.green),)),
                                Center(child: Text('Ideal : 0',style: TextStyle(color: Colors.orange),)),
                                Center(child: Text('Rapier : 0',style: TextStyle(color: Colors.red),)),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


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