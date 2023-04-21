
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'Students.dart';
import 'package:web_dashboard_app_tut/Utils/addRooms.dart';
import 'package:web_dashboard_app_tut/screens/allRooms.dart';

class RoomsScreen extends StatefulWidget {
  RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

int selectedIndex = 2;
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

class _RoomsScreenState extends State<RoomsScreen> {
  //setting the expansion function for the navigation rail
  bool isExpanded = false;

  String _selectedHostel = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "All Rooms",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 70, 151, 1),
                                      fontSize: 28,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    DropdownButton<String>(
                                      value: _selectedHostel,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'All',
                                          child: Text('All'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'HR-1',
                                          child: Text('HR-1'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'HR-2',
                                          child: Text('HR-2'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedHostel = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Hero(
                              tag: 'Rooms',
                              child: SizedBox(
                                height: 1000,
                                width: 800,
                                child: Column(
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => AllRooms()),
                                            );
                                          },
                                          child: Text('View All'),
                                        ),
                                      ],
                                      source: RoomDataSource(_rooms,context),
                                      header: Text('Rooms'),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  addRooms()

                ],
              ),
              FooterWidget()
            ],
          ),
        )


        );
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
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(47, 50, 121, 1),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'close',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
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
