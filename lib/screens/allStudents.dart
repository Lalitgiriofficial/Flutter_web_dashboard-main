import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_dashboard_app_tut/Utils/addStudent.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class AllStudents extends StatefulWidget {
  AllStudents({Key? key}) : super(key: key);

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

List<StudentData> _filteredList = [];

class StudentData {
  final int id;
  final String name;
  final String rollNumber;
  final String hostel;
  final String roomNumber;

  StudentData({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.hostel,
    required this.roomNumber,
  });
}

final List<StudentData> _students = [
  StudentData(
    id: 1,
    name: 'Aarav Singh',
    rollNumber: '2019BCE1001',
    hostel: 'HR-1',
    roomNumber: '101',
  ),
  StudentData(
    id: 2,
    name: 'Aryan Gupta',
    rollNumber: '2018BCE1002',
    hostel: 'HR-2',
    roomNumber: '102',
  ),
  StudentData(
    id: 3,
    name: 'Rohan Sharma',
    rollNumber: '202018BCE1003',
    hostel: 'HR-1',
    roomNumber: '103',
  ),
  StudentData(
    id: 4,
    name: 'Siddharth Patel',
    rollNumber: '20193BCE1004',
    hostel: 'HR-2',
    roomNumber: '104',
  ),
  StudentData(
    id: 5,
    name: 'Kunal Shah',
    rollNumber: '2019BCE1005',
    hostel: 'HR-1',
    roomNumber: '105',
  ),
  StudentData(
    id: 6,
    name: 'Aditya Verma',
    rollNumber: '2018BCE1006',
    hostel: 'HR-2',
    roomNumber: '106',
  ),
  StudentData(
    id: 7,
    name: 'Vikram Singh',
    rollNumber: '20193BCE1007',
    hostel: 'HR-1',
    roomNumber: '107',
  ),
  StudentData(
    id: 8,
    name: 'Karan Sharma',
    rollNumber: '202018BCE1008',
    hostel: 'HR-2',
    roomNumber: '108',
  ),
  StudentData(
    id: 9,
    name: 'Akash Patel',
    rollNumber: '2019BCE1009',
    hostel: 'HR-1',
    roomNumber: '109',
  ),
  StudentData(
    id: 10,
    name: 'Rahul Mehta',
    rollNumber: '2018BCE1010',
    hostel: 'HR-2',
    roomNumber: '110',
  ),
  StudentData(
    id: 11,
    name: 'Sahil Gupta',
    rollNumber: '20193BCE1011',
    hostel: 'HR-1',
    roomNumber: '111',
  ),
  StudentData(
    id: 12,
    name: 'Amit Sharma',
    rollNumber: '2019BCE1012',
    hostel: 'HR-2',
    roomNumber: '112',
  ),
  StudentData(
    id: 13,
    name: 'Rajesh Patel',
    rollNumber: '2018BCE1013',
    hostel: 'HR-1',
    roomNumber: '113',
  ),
  StudentData(
    id: 14,
    name: 'Devansh Singh',
    rollNumber: '202018BCE1014',
    hostel: 'HR-2',
    roomNumber: '114',
  ),
  StudentData(
    id: 15,
    name: 'Alok Gupta',
    rollNumber: '20193BCE1015',
    hostel: 'HR-1',
    roomNumber: '115',
  ),
];
final TextStyle _headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Roboto',
);

final List<DataColumn> _columns = [
  DataColumn(label: Text('ID', style: _headerStyle)),
  DataColumn(label: Text('Student Name', style: _headerStyle)),
  DataColumn(label: Text('Roll Number', style: _headerStyle)),
  DataColumn(label: Text('Hostel', style: _headerStyle)),
  DataColumn(label: Text('Room Number', style: _headerStyle)),
];
bool isExpanded = false;
int selectedIndex = 1;

class _AllStudentsState extends State<AllStudents> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  String _selectedHostel = 'All';

  //setting the expansion function for the navigation rail
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    _filteredList = _students;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DataRow> rows = [
      const DataRow(cells: [
        DataCell(Text("1")),
        DataCell(Text("lalit giri")),
        DataCell(Text("201910183")),
        DataCell(Text("HR-2")),
        DataCell(Text("715")),
      ]),
      const DataRow(cells: [
        DataCell(Text("2")),
        DataCell(Text("Surya prakash das")),
        DataCell(Text("201910188")),
        DataCell(Text("HR-2")),
        DataCell(Text("514")),
      ]),
      const DataRow(cells: [
        DataCell(Text("3")),
        DataCell(Text("Manish kumar")),
        DataCell(Text("201910149")),
        DataCell(Text("HR-2")),
        DataCell(Text("710")),
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
                      "All Students",
                      style: TextStyle(
                          color: Color.fromRGBO(45, 70, 151, 1),
                          fontSize: 28,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        DropdownButton(
                            hint: Text("Filter by"),
                            items: [
                              DropdownMenuItem(
                                value: 'All',
                                child: Text('All'),
                              ),
                              DropdownMenuItem(
                                value: "HR-1",
                                child: Text("HR-1"),
                              ),
                              DropdownMenuItem(
                                value: "HR-2",
                                child: Text("HR-2"),
                              ),
                            ],
                            value: _selectedHostel,
                            onChanged: (val) {
                              setState(() {
                                _selectedHostel = val!.toString();
                                if (_selectedHostel == "All") {
                                  _filteredList = _students;
                                } else {
                                  _filteredList = _students
                                      .where((student) =>
                                          student.hostel.toLowerCase() ==
                                          _selectedHostel.toLowerCase())
                                      .toList();
                                }
                              });
                            }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Hero(
                  tag: 'students',
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 20,
                    width: MediaQuery.of(context).size.width - 20,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PaginatedDataTable(
                            actions: [
                              Icon(Icons.search_rounded)
                            ],
                            header: Text("Student List",
                                style: GoogleFonts.roboto()),
                            columns: _columns,
                            source: _DataSource(),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ],
    ));
  }
}

class _DataSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    final student = _filteredList[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(student.id.toString())),
        DataCell(Text(student.name)),
        DataCell(Text(student.rollNumber)),
        DataCell(Text(student.hostel)),
        DataCell(Text(student.roomNumber)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _filteredList.length;

  @override
  int get selectedRowCount => 0;

  @override
  Future<void> pageTo(int rowIndex) async {
    pageTo(rowIndex);
  }
}
