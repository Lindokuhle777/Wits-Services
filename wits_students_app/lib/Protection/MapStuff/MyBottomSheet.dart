import 'package:flutter/material.dart';
import 'package:wits_students_app/Protection/Blocs/application_bloc.dart';

class MyBottomSheet extends StatefulWidget {
  final ApplicationBloc applicationBloc;

  const MyBottomSheet(this.applicationBloc, {Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String dropdownvalue = '';
  String dropdownvalue2 = '';

  // List of items in our dropdown menu
  var items = [
    '',
    'Main Campus',
    'Education Campus',
    'Health Science Campus',
  ];

  var items2 = [
    '',
  ];

  // var items2 = [
  //   '',
  //   'Campus Africa',
  //   'Gateway',
  //   'Student Digz',
  //   'J-One',
  //   'Mpumelelo',
  //   'Richmond',
  //   'South Point',
  //   'Quintal',
  //   'JORRISON 22',
  // ];
  var from = TextEditingController(text: '');
  var to = TextEditingController(text: '');

  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Container(
              // color: Colors.grey,
              // height:  MediaQuery.of(context).size.height/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(
                        'From:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: .5),
                    ),
                    // color: Colors.red,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: const TextStyle(fontSize: 18.0),),
                          onTap: () {
                            setState(() {
                              from.text = items;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 15, top: 5),
                      child: const Text(
                        'To:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                      child: TextField(
                        controller: to,
                        autofocus: true,
                        enabled: false,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue.shade100,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            )),
                        onChanged: (value) async {
                          await widget.applicationBloc.searchPlaces(value);
                          setState(() {});
                        },
                      ),
                      onTap: (){
                        setState(() {
                          showPopup = true;
                        });
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Text(
                          'BOOK',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        if(showPopup)
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: ListTile(
                      trailing: const Text('X'),
                      onTap: (){
                        setState(() {
                          showPopup = false;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height-500,
                    child: ListView.builder(
                      itemCount: vehicles.length,
                      itemBuilder: (context, i) {
                        return ExpansionTile(
                          title: Text(vehicles[i].title, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                          children: <Widget>[
                            Column(
                              children: _buildExpandableContent(vehicles[i]),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  _buildExpandableContent(Resident vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents) {
      columnContent.add(
        ListTile(
          title: Text(content, style: const TextStyle(fontSize: 18.0),),
          leading: Icon(vehicle.icon),
          onTap: (){
            to.text = content;
            setState(() {
              showPopup = false;
            });
          },
        ),
      );
    }

    return columnContent;
  }
}


class Resident {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Resident(this.title, this.contents, this.icon);
}

List<Resident> vehicles = [
  Resident(
    'South Point',
    ['19 Melle Street, Braamfontein', '56 Stiemens Street, Braamfontein', '56 Jorissen Street, Braamfontein', '20 Melle St, Braamfontein '],
    Icons.motorcycle,
  ),
  Resident(
    'Richmond',
    ['56 Richmond Avenue, Auckland Park', '59 Richmond Avenue, Auckland Park', '38 Richmond Avenue, Auckland Park'],
    Icons.directions_car,
  ),
  Resident(
    'URBAN CIRCLE',
    ['13 Buxton Street, Doornfontein', '8 Buxton Street, Doonfontein', '36 Siemert Road, New Doornfontein', '37 Stanley Avenue, Auckland Park'],
    Icons.directions_car,
  ),
];

//
