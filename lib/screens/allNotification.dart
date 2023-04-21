import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_dashboard_app_tut/Utils/addStudent.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class AllNotifications extends StatefulWidget {
  AllNotifications({Key? key}) : super(key: key);

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}
final List<DataRow> rows = [
  const DataRow(cells: [
    DataCell(Text('1')),
    DataCell(Text('Purendu Mishra')),
    DataCell(Text('Mess fees')),
    DataCell(Text('Mess fees increased by 1000')),
  ]),
  const DataRow(cells: [
    DataCell(Text('2')),
    DataCell(Text('Purendu Mishra')),
    DataCell(Text('Wifi')),
    DataCell(Text('Campus wifi will not work for 2 days')),
  ]),
  const DataRow(cells: [
    DataCell(Text('3')),
    DataCell(Text('Purendu mishra')),
    DataCell(Text('Lift')),
    DataCell(
        Text('Lift is now functional and can be used between 6am to 11 pm')),
  ]),
  const DataRow(cells: [
    DataCell(Text('4')),
    DataCell(Text('Purnendu mishra')),
    DataCell(Text('Grand Dinner')),
    DataCell(Text(
        'Grand dinner will be provided the coming sunday so you need to collect token from hostel recption.')),
  ]),
  const DataRow(cells: [
    DataCell(Text('3')),
    DataCell(Text('Purnendu mishra')),
    DataCell(Text('Clearance')),
    DataCell(Text(
        'Btech final year students need to take clearance before 10-5-2023')),
  ]),
];
final TextStyle _headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

class _NotificationDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _notifications = [
    {
      'sno': 1,
      'from': 'Hostel Superintendent',
      'subject': 'Upcoming Maintenance Work',
      'description':
          'Dear students, please be informed that the maintenance work of the hostel building will be carried out on 23rd April 2023 from 10 AM to 2 PM. During this time, you are requested to stay outside the hostel premises. Sorry for the inconvenience.',
      'date_created': '2023-04-18',
    },
    {
      'sno': 2,
      'from': 'Hostel Superintendent',
      'subject': 'New Guidelines for Visitors',
      'description':
          'As per the latest circular issued by the university, all visitors to the hostel premises must carry a valid ID proof and register at the hostel reception before entering. Please inform your parents and relatives accordingly.',
      'date_created': '2023-04-17',
    },
    {
      'sno': 3,
      'from': 'Hostel Superintendent',
      'subject': 'Reminder: Mess Timings',
      'description':
          'This is a gentle reminder that the mess timings are strictly from 7 AM to 10 AM for breakfast, 12 PM to 2 PM for lunch, and 7 PM to 9 PM for dinner. Please adhere to the timings to avoid any inconvenience.',
      'date_created': '2023-04-16',
    },
  ];

  @override
  DataRow getRow(int index) {
    final notification = _notifications[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${notification['sno']}')),
        DataCell(Text('${notification['from']}')),
        DataCell(Text('${notification['subject']}')),
        DataCell(Text('${notification['description']}')),
        DataCell(Text('${notification['date_created']}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _notifications.length;

  @override
  int get selectedRowCount => 0;
}

int selectedIndex = 1;

class _AllNotificationsState extends State<AllNotifications> {
  @override
  Widget build(BuildContext context) {
    final List<DataRow> rows = [
      const DataRow(cells: [
        DataCell(Text('1')),
        DataCell(Text('Purendu Mishra')),
        DataCell(Text('Mess fees')),
        DataCell(Text('Mess fees increased by 1000')),
      ]),
      const DataRow(cells: [
        DataCell(Text('2')),
        DataCell(Text('Purendu Mishra')),
        DataCell(Text('Wifi')),
        DataCell(Text('Campus wifi will not work for 2 days')),
      ]),
      const DataRow(cells: [
        DataCell(Text('3')),
        DataCell(Text('Purendu mishra')),
        DataCell(Text('Lift')),
        DataCell(Text(
            'Lift is now functional and can be used between 6am to 11 pm')),
      ]),
      const DataRow(cells: [
        DataCell(Text('4')),
        DataCell(Text('Purnendu mishra')),
        DataCell(Text('Grand Dinner')),
        DataCell(Text(
            'Grand dinner will be provided the coming sunday so you need to collect token from hostel recption.')),
      ]),
      const DataRow(cells: [
        DataCell(Text('3')),
        DataCell(Text('Purnendu mishra')),
        DataCell(Text('Clearance')),
        DataCell(Text(
            'Btech final year students need to take clearance before 10-5-2023')),
      ]),
    ];
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios_new),
                          ),
                           Text(
                            "All Notifications",
                            style: TextStyle(
                                color: Color.fromRGBO(45, 70, 151, 1),
                                fontSize: 28,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              DropdownButton(
                                  hint: const Text("Order By"),
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Oldest",
                                      child: Text("Oldest"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Newest",
                                      child: Text("Newest"),
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
                      SizedBox(
                        height: 300,
                        width: 1200,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          PaginatedDataTable(
                          columns: const [
                          DataColumn(label: Text('Sno')),
                          DataColumn(label: Text('From')),
                          DataColumn(label: Text('Subject')),
                          DataColumn(label: Text('Description')),
                          ],
                          source: _DataSource(rows.cast<Map<String, dynamic>>()),
                header: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Notification List",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.search_rounded),
                  ],
                ),
                onPageChanged: (pageIndex) {
                  // TODO: Implement page change logic
                },
                rowsPerPage: 10,
                availableRowsPerPage: [10, 20, 50],
                showFirstLastButtons: true,
              ),


      //Now let's set the pagination
                              const SizedBox(
                                height: 40.0,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),)
        ),
      ],
    ));
  }
}



class _DataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _DataSource(this._data);

  @override
  DataRow getRow(int index) {
    final row = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(row['sno'].toString())),
        DataCell(Text(row['from'])),
        DataCell(Text(row['subject'])),
        DataCell(Text(row['description'])),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}


