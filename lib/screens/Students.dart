import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_dashboard_app_tut/Utils/addStudent.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'package:web_dashboard_app_tut/screens/HomePage.dart';
import 'package:web_dashboard_app_tut/screens/allStudents.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class StudentScreen extends StatefulWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

void showStudentDetails(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          alignment: Alignment.center,
          child: Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/icons/graduated1.png'),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Lalit Giri',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Roll Number:- 201910183',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Hostel:- HR-2',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Room Number:- 710',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Registration Number:- 1901202067',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Phone number:- 9597137863',
                  style: TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'close',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(47, 50, 121, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



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
      name: 'Aditi Sharma',
      rollNumber: '18BCE1001',
      hostel: 'HR-1',
      roomNumber: '101'),
  StudentData(
      id: 2,
      name: 'Aryan Gupta',
      rollNumber: '18BCE1002',
      hostel: 'HR-2',
      roomNumber: '102'),
  StudentData(
      id: 3,
      name: 'Manoj Kumar',
      rollNumber: '18BCE1003',
      hostel: 'HR-1',
      roomNumber: '103'),
  StudentData(
      id: 4,
      name: 'Priya Singh',
      rollNumber: '18BCE1004',
      hostel: 'HR-2',
      roomNumber: '104'),
  StudentData(
      id: 5,
      name: 'Rahul Verma',
      rollNumber: '18BCE1005',
      hostel: 'HR-1',
      roomNumber: '105'),
  StudentData(
      id: 6,
      name: 'Sneha Sharma',
      rollNumber: '18BCE1006',
      hostel: 'HR-2',
      roomNumber: '106'),
  StudentData(
      id: 7,
      name: 'Vikas Chauhan',
      rollNumber: '18BCE1007',
      hostel: 'HR-1',
      roomNumber: '107'),
  StudentData(
      id: 8,
      name: 'Zoya Khan',
      rollNumber: '18BCE1008',
      hostel: 'HR-2',
      roomNumber: '108'),
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
bool isExpanded=false;
int selectedIndex = 1;

List<StudentData> _filteredStudents = [];
List<StudentData> _filteredList= [];
//
TextEditingController _searchController = TextEditingController();

class _StudentScreenState extends State<StudentScreen> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    _filteredStudents = _students;
    _filteredList=_students;
    // _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {


    super.dispose();
  }



  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  String _selectedHostel = 'All';

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Student Screen",
                                          style: TextStyle(
                                              color: Color.fromRGBO(45, 70, 151, 1),
                                              fontSize: 32,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      StudentCard(
                                        hostel: "HR-1",
                                        totalStudents: 958,
                                        courseCounts: {
                                          'B.Tech': 940,
                                          'MBA': 10,
                                          'B.Com': 8,
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      StudentCard(
                                        hostel: "HR-2",
                                        totalStudents: 1015,
                                        courseCounts: {
                                          'B.Tech': 996,
                                          'MBA': 13,
                                          'B.Com': 6,
                                        },
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Expanded(
                                              child: TextField(
                                                onChanged: (text) {
                                                  // filter the list based on the entered text
                                                  setState(() {
                                                    _filteredStudents = _students.where((student) =>
                                                    student.name.toLowerCase().contains(text.toLowerCase()) ||
                                                        student.rollNumber.toLowerCase().contains(text.toLowerCase()) ||
                                                        student.roomNumber.toLowerCase().contains(text.toLowerCase())).toList();
                                                  });
                                                },
                                                style: TextStyle(color: Colors.black),
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                    color: Colors
                                                        .black, // set hint text color here
                                                  ),
                                                  hintText: "Search Student",
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.black,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), // set border color here
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .black), // set focused border color here
                                                  ),
                                                ),
                                                // controller: _searchController,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          SizedBox(
                                            width: 300.0,
                                            height: 250,
                                            child: Expanded(
                                              child: ListView.builder(
                                                itemCount: _filteredStudents.length,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  final student = _filteredStudents[index];
                                                  return ListTile(
                                                    leading: const CircleAvatar(
                                                        backgroundColor: Colors.white24,
                                                        backgroundImage: AssetImage(
                                                            'assets/icons/graduated2.png')),
                                                    title: Text(
                                                      student.name,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onTap: () {
                                                      // do something when the tile is tapped
                                                      showStudentDetails(context);
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
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
                                          hint:  Text("Filter by"),
                                          items:  [
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
                                              _filteredList = _students.where((student) =>
                                              student.hostel.toLowerCase()==_selectedHostel.toLowerCase()).toList();
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
                                  height: 1000,
                                  width: 800,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: PaginatedDataTable(
                                            header:Text("Student List",style: GoogleFonts.roboto()),
                                            columns: _columns,
                                            source: _DataSource(),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => AllStudents()),
                                                  );
                                                },
                                                child: Text('View All'),
                                              ),
                                            ],
                                          ),
                                        ),


                                        const SizedBox(
                                          height: 40.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AddStudentForm(),
                  )


                ],
              ),
              FooterWidget(),
            ],
          )
        ),


    );


  }
}

class StudentCard extends StatelessWidget {
  final String hostel;
  final int totalStudents;
  final Map<String, int> courseCounts;

  const StudentCard({
    required this.totalStudents,
    required this.courseCounts,
    required this.hostel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5338DE),
            Color(0xFF9C71D7),
            Color(0xFFE78EDF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Total Students in HR-1 :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 2.0),
                Text(
                  totalStudents.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: courseCounts.entries
                      .map((entry) => Text(
                            '${entry.key}: ${entry.value} ',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
