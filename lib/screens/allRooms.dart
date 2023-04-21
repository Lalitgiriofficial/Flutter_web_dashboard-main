
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_dashboard_app_tut/screens/Students.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class AllRooms extends StatefulWidget {
  AllRooms({Key? key}) : super(key: key);

  @override
  State<AllRooms> createState() => _AllRoomsState();
}
final List<RoomData> _rooms = [
  RoomData(
    id: 1,
    hostel: 'HR-1',
    block: 'A',
    roomNumber: '101',
    roommates: ['Ravi Kumar', 'Rahul Sharma', 'Amit Singh', 'Sandeep Gupta'],
  ),
  RoomData(
    id: 2,
    hostel: 'HR-2',
    block: '-',
    roomNumber: '102',
    roommates: ['Vikas Chauhan', 'Suresh Kumar', 'Gaurav Singh'],
  ),
  RoomData(
    id: 3,
    hostel: 'HR-1',
    block: 'B',
    roomNumber: '103',
    roommates: ['Anil Kumar', 'Rohit Sharma', 'Alok Yadav', 'Aman Singh'],
  ),
  RoomData(
    id: 4,
    hostel: 'HR-2',
    block: '-',
    roomNumber: '104',
    roommates: [
      'Siddharth Gupta',
      'Arvind Kumar',
      'Mohit Sharma',
      'Vivek Singh'
    ],
  ),
  RoomData(
    id: 5,
    hostel: 'HR-1',
    block: 'C',
    roomNumber: '105',
    roommates: ['Manoj Kumar', 'Ravi Verma', 'Ashish Singh', 'Sachin Sharma'],
  ),
  RoomData(
    id: 6,
    hostel: 'HR-2',
    block: '-',
    roomNumber: '106',
    roommates: ['Rahul Verma', 'Amit Kumar', 'Vijay Singh'],
  ),
  RoomData(
    id: 7,
    hostel: 'HR-1',
    block: 'D',
    roomNumber: '107',
    roommates: ['Amit Sharma', 'Avinash Kumar', 'Ankit Singh', 'Saurabh Verma'],
  ),
  RoomData(
    id: 8,
    hostel: 'HR-2',
    block: '-',
    roomNumber: '108',
    roommates: ['Anand Kumar', 'Vikram Singh', 'Abhinav Gupta', 'Ramesh Kumar'],
  ),
];
List<StudentData> _filteredList = [];
class StudentData {
  final int id;

  final String hostel;
  final String roomNumber;
  final String block;
  final List<String> roommates;

  StudentData({
    required this.id,

    required this.hostel,
    required this.roomNumber,
    required this.block,
    required this.roommates,
  });
}


final List<StudentData> _students = [
StudentData(
id: 1,
hostel: 'HR-1',
block: 'A',
roomNumber: '101',
roommates: ['Abhishek', 'Amit', 'Ankit', 'Akash'],
),
StudentData(
id: 2,
hostel: 'HR-2',
block: '-',
roomNumber: '102',
roommates: ['Bharat', 'Bhavya', 'Brijesh'],
),
StudentData(
id: 3,
hostel: 'HR-1',
block: 'B',
roomNumber: '201',
roommates: ['Chetan', 'Chirag', 'Chandan', 'Chaitanya'],
),
StudentData(
id: 4,
hostel: 'HR-2',
block: '-',
roomNumber: '103',
roommates: ['Dhruv', 'Divyansh', 'Deepak'],
),
StudentData(
id: 5,
hostel: 'HR-1',
block: 'A',
roomNumber: '102',
roommates: ['Eshaan', 'Eklavya', 'Ekansh', 'Esha'],
),
StudentData(
id: 6,
hostel: 'HR-2',
block: '-',
roomNumber: '104',
roommates: ['Fahad', 'Firoz', 'Farhan'],
),
StudentData(
id: 7,
hostel: 'HR-1',
block: 'B',
roomNumber: '202',
roommates: ['Girish', 'Ganesh', 'Gaurav', 'Gulshan'],
),
StudentData(
id: 8,
hostel: 'HR-2',
block: '-',
roomNumber: '105',
roommates: ['Himanshu', 'Harsh', 'Harshit'],
),
StudentData(
id: 9,
hostel: 'HR-1',
block: 'A',
roomNumber: '103',
roommates: ['Ishan', 'Ishwar', 'Ishaan', 'Ishant'],
),
StudentData(
id: 10,
hostel: 'HR-2',
block: '-',
roomNumber: '106',
roommates: ['Jatin', 'Jaspreet', 'Jayesh'],
),
StudentData(
id: 11,
hostel: 'HR-1',
block: 'B',
roomNumber: '203',
roommates: ['Karan', 'Kartik', 'Kunal', 'Keshav'],
),
StudentData(
id: 12,
hostel: 'HR-2',
block: '-',
roomNumber: '107',
roommates: ['Lalit', 'Laxman', 'Lokesh'],
),
StudentData(
id: 13,
hostel: 'HR-1',
block: 'A',
roomNumber: '104',
roommates: ['Manish', 'Mayank', 'Mohit', 'Mukesh'],
),
StudentData(
id: 14,
hostel: 'HR-2',
block: '-',
roomNumber: '108',
roommates: ['Nishant', 'Nitin', 'Nave'])];

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

class _AllRoomsState extends State<AllRooms> {
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
                          tag: 'Rooms',
                          child: 
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 20,
                            width: MediaQuery.of(context).size.width - 20,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  PaginatedDataTable(
                                    columns: [
                                      DataColumn(label: Text('ID')),
                                      DataColumn(label: Text('Hostel')),
                                      DataColumn(label: Text('Block')),
                                      DataColumn(label: Text('Room Number')),
                                      DataColumn(label: Text('Roommates')),
                                    ],
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                         Navigator.of(context).pop();
                                        },
                                        child: Text('Minimize'),
                                      ),
                                    ],
                                    source: RoomDataSource(_rooms,context),
                                    header: Text('Rooms'),
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

  int _selectedRowCount = 0;



  @override
  DataRow? getRow(int index) {
    if (index >= _students.length) {
      return null;
    }
    final student = _filteredList[index];
    return DataRow.byIndex(
      index: index,
      selected: student.block == "-",
      onSelectChanged: student.block == "-"
          ? null
          : (value) {
        if (student.block != "-") {
          print('Selected row $index');
        }
      },
      cells: [
        DataCell(Text(student.id.toString())),
        DataCell(Text(student.hostel)),
        DataCell(Text(student.block)),
        DataCell(Text(student.roomNumber)),
        DataCell(
          Wrap(
            spacing: 8.0,
            children: student.roommates.map((roommate) {
              return InkWell(
                child: Text(
                  roommate,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () {
                  print('Selected $roommate');
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => _students.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRowCount;
}

class _Row {
  final int id;
  final String hostel;
  final String block;
  final String roomNumber;
  final List<String> roommates;
  final VoidCallback? onTap;

  _Row({
    required this.id,
    required this.hostel,
    required this.block,
    required this.roomNumber,
    required this.roommates,
    this.onTap,
  });

  DataRow getRow() {
    return DataRow(
      cells: [
        DataCell(Text('$id')),
        DataCell(Text(hostel)),
        DataCell(Text(block)),
        DataCell(Text(roomNumber)),
        DataCell(
          Row(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: roommates.length,
                  itemBuilder: (context, index) {
                    final roommate = roommates[index];
                    return GestureDetector(
                      child: Text(
                        roommate,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: onTap,
                    );
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class RoomDataSource extends DataTableSource {
  final List<RoomData> _rooms;
  BuildContext _context;

  RoomDataSource(this._rooms, this._context);
  int _selectedCount = 0;


  DataCell _buildRoommatesCell(List<String> roommates) {
    return DataCell(
      Wrap(
        spacing: 5,
        children: roommates
            .map((roommate) => ActionChip(
          backgroundColor: Colors.grey,
          label: Text(
            roommate,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {

          },
        ))
            .toList(),
      ),
    );
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rooms.length)
      return DataRow(cells: [
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
        DataCell(Text("")),
      ]);
    final room = _rooms[index];
    return DataRow(
      cells: [
        DataCell(Text(room.id.toString())),
        DataCell(Text(room.hostel)),
        DataCell(Text(room.block ?? '-')),
        DataCell(Text(room.roomNumber)),
        DataCell(Row(
          children: room.roommates
              .map((name) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              onPressed: () {
                showStudentDetails(_context);
              },
              child: Text(name),
            ),
          ))
              .toList(),
        )),
      ],
    );
  }

  @override
  int get rowCount => _rooms.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}


class RoomData {
  final int id;
  final String hostel;
  final String block;
  final String roomNumber;
  final List<String> roommates;

  RoomData({
    required this.id,
    required this.hostel,
    required this.block,
    required this.roomNumber,
    required this.roommates,
  });
}