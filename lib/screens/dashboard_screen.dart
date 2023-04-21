import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'package:web_dashboard_app_tut/screens/HomePage.dart';
import 'package:web_dashboard_app_tut/screens/Students.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

int selectedIndex = 0;

class _DashboardScreenState extends State<DashboardScreen> {
  final Gradient backgroundGradient = LinearGradient(
    colors: [Color.fromRGBO(45, 70, 151, 1), Color.fromRGBO(55, 83, 175, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  //setting the expansion function for the navigation rail
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      DashboardScreen(),
      StudentScreen(),
      RoomsScreen(),
      ComplaintScreen(),
      NotificationScreen()
    ];

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(60),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Now let's start with the dashboard main rapports
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    key: UniqueKey(),
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            index: 1,
                                          )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white70,
                                            Colors.white60,
                                            Colors.white54,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Image.asset(
                                                        "assets/icons/graduated2.png",
                                                        width: 25),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Center(
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Flexible(
                                                        child: Text(
                                                          "Total Students",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              const Center(
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    "1973",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          45, 70, 151, 1),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                      key: UniqueKey(),
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                            builder: (context) => HomePage(
                                              index: 2,
                                            )));
                                      },
                                      child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16.0),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.centerLeft,
                                                  colors: [
                                                    Colors.white70,
                                                    Colors.white60,
                                                    Colors.white54,
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(18.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/icons/open-door.png",
                                                          width: 25,
                                                        ),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        const Center(
                                                          child: FittedBox(
                                                            fit: BoxFit.fitWidth,
                                                            child: Flexible(
                                                              child: Text(
                                                                "Total Rooms",
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    const Center(
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          "120",
                                                          style: TextStyle(
                                                            color: Color.fromRGBO(
                                                                45, 70, 151, 1),
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          })),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    key: UniqueKey(),
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            index: 3,
                                          )));
                                    },
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16.0),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white70,
                                                  Colors.white60,
                                                  Colors.white54,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/icons/report.png",
                                                        width: 25,
                                                      ),
                                                      const SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      const Center(
                                                        child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Flexible(
                                                            child: Text(
                                                              "  Complaints",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  const Center(
                                                    child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        "3 Complaints",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color.fromRGBO(
                                                              45, 70, 151, 1),
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    key: UniqueKey(),
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            index: 4,
                                          )));
                                    },
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.0),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.centerLeft,
                                              colors: [
                                                Colors.white70,
                                                Colors.white60,
                                                Colors.white54,
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/notification.png",
                                                      width: 25,
                                                    ),
                                                    const SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    const Center(
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Flexible(
                                                          child: Text(
                                                            "    Notification",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      "40+",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Color.fromRGBO(
                                                            45, 70, 151, 1),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Now let's set the article section
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Hostels \n",
                                    style: TextStyle(
                                      color: Color.fromRGBO(45, 70, 151, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "HR-1 & HR-2",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 300.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search Student",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),

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
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            FooterWidget()
          ],
        ),
      )

    );
  }
}
