import 'package:flutter/material.dart';
import 'package:wits_students_app/Protection/Blocs/application_bloc.dart';

class MyBottomSheet extends StatefulWidget {
  final ApplicationBloc applicationBloc;
  const MyBottomSheet(this.applicationBloc, {Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();

}

class _MyBottomSheetState extends State<MyBottomSheet> {

  String dropdownvalue = 'Item 1';
  String dropdownvalue2 = 'Item 2';

  // List of items in our dropdown menu
  var items = [
    'Main Campus',
    'Education Campus',
    'Health Science Campus',
  ];

  var items2 = [
    'Campus Africa',
    'Gateway',
    'Student Digz',
    'J-One',
    'Mpumelelo',
    'Richmond',
    'South Point',
    'Quintal',
    'JORRISON 22',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // color: Colors.grey,
          // height: 500,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              ListTile(
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 35,
                  ),
                ),
              ),
              Container(
                  margin:
                  const EdgeInsets.symmetric(
                      horizontal: 15),
                  child: const Text(
                    'From:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor:
                      Colors.blue.shade100,
                      prefixIcon: const Icon(
                          Icons.my_location),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: DropdownButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 15, top: 5),
                  child: const Text(
                    'To:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              Container(
                height: 50,
                margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor:
                      Colors.blue.shade100,
                      prefixIcon:
                      const Icon(Icons.search),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: DropdownButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items2.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue2 = newValue!;
                            });
                          },
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                        borderSide: BorderSide.none,
                      )),
                  onChanged: (value) async {
                    await widget.applicationBloc
                        .searchPlaces(value);
                    setState(() {});
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 200),
                  child: FloatingActionButton(

                    onPressed: (){},
                    child: const Text(
                      'BOOK',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
