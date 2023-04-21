import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'package:web_dashboard_app_tut/screens/Students.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';

class ComplaintScreen extends StatefulWidget {
  ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

int selectedIndex = 3;

class _ComplaintScreenState extends State<ComplaintScreen> {


  //setting the expansion function for the navigation rail
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //let's set the filter section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "All Complaints",
                                style: TextStyle(
                                    color: Color.fromRGBO(45, 70, 151, 1),
                                    fontSize: 28,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  DropdownButton(
                                      hint: const Text("Order by"),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Neweset",
                                          child: Text("Newest"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Oldest",
                                          child: Text("Oldest"),
                                        ),
                                      ],
                                      onChanged: (value) {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          //Now let's add the Table
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DataTable(
                                  headingRowColor: MaterialStateProperty.resolveWith(
                                          (states) => Colors.grey.shade200),
                                  columns: const [
                                    DataColumn(label: Text("ID")),
                                    DataColumn(label: Text("Student name")),
                                    DataColumn(label: Text("Subject")),
                                    DataColumn(label: Text("Description")),
                                    DataColumn(label: Text("Creation Date")),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      const DataCell(Text("1")),
                                      const DataCell(Text("Rohan Gupta")),
                                      const DataCell(Text("Electricity")),
                                      const DataCell(
                                          Text("Power cut at 2pm everyday")),
                                      DataCell(Text("${DateTime.now()}")),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(Text("2")),
                                      const DataCell(Text("Samar chauhan")),
                                      const DataCell(Text("Lift")),
                                      const DataCell(Text("Lift not working")),
                                      DataCell(Text("${DateTime.now()}")),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(Text("3")),
                                      const DataCell(Text("Harsh rajput")),
                                      const DataCell(Text("Cleaning")),
                                      const DataCell(Text(
                                          "Proper cleaning of rooms is not happening")),
                                      DataCell(Text("${DateTime.now()}")),
                                    ]),
                                  ]),
                              //Now let's set the pagination
                              const SizedBox(
                                height: 40.0,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FooterWidget()
          ],
        ),
      )


    );
  }
}
