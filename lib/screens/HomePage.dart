import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/Utils/footer.dart';
import 'package:web_dashboard_app_tut/screens/Students.dart';
import 'package:web_dashboard_app_tut/screens/allStudents.dart';
import 'package:web_dashboard_app_tut/screens/complaints.dart';
import 'package:web_dashboard_app_tut/screens/dashboard_screen.dart';
import 'package:web_dashboard_app_tut/screens/notification.dart';
import 'package:web_dashboard_app_tut/screens/rooms.dart';

class HomePage extends StatefulWidget {
  int index;

  HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  bool isExpanded = false;
  final List<Widget> _pages = [    DashboardScreen(),    StudentScreen(),    RoomsScreen(),    ComplaintScreen(),    NotificationScreen(),  ];

  void _onItemTapped(int idx) {
    setState(() {
      widget.index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    leading: IconButton(
        onPressed: () {
      //let's trigger the navigation expansion
      setState(() {
        isExpanded = !isExpanded;
      });
    },
    icon: const Icon(
    Icons.menu,
    color: Colors.white,
    ),
    ),
    backgroundColor: const Color.fromRGBO(45, 70, 151, 1),
    elevation: 5,
    title: Row(
    children: [
    CircleAvatar(
    backgroundColor:const Color.fromRGBO(45, 70, 151, 1) ,
    radius: 20,
    child: Image.asset('assets/images/nist.png',fit: BoxFit.fill,)),
    Center(child: Text(" Admin Dashboard")),
    ],
    ),
    ),
    body: Row(
    children: [
    NavigationRail(
    extended: isExpanded,
    selectedIndex: widget.index,
    backgroundColor: Colors.black12,
    onDestinationSelected: (int index) {
    setState(() {
    widget.index = index;
    isExpanded = false;
    });
    _pageController.animateToPage(
    widget.index,
    duration: const Duration(milliseconds: 500),
    curve: Curves.ease,
    );
    },
    labelType: NavigationRailLabelType.none,
    unselectedIconTheme:
    const IconThemeData(color: Colors.black, opacity: 1),
    unselectedLabelTextStyle: const TextStyle(
    color: Colors.black,
    ),
    selectedIconTheme:
    const IconThemeData(color: Color.fromRGBO(45, 70, 151, 1)),
    destinations: [
    NavigationRailDestination(
    icon: Image.asset(
    "assets/icons/dashboard1.png",
    width: 25,
    ),
    label: const Text("Dashboard"),
    ),
    NavigationRailDestination(
    icon: Image.asset("assets/icons/graduated1.png", width: 25),
    label: const Text("Students"),
    ),

    NavigationRailDestination(
                icon: Image.asset(
                  "assets/icons/open-door.png",
                  width: 25,
                ),
                label: const Text("Rooms"),
              ),
              NavigationRailDestination(
                icon: Image.asset(
                  "assets/icons/report.png",
                  width: 25,
                ),
                label: const Text("Complaints"),
              ),
              NavigationRailDestination(
                icon: Image.asset(
                  "assets/icons/notification.png",
                  width: 25,
                ),
                label: const Text("Notification"),
              ),
            ],
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            children: [_pages[widget.index]],
          ))
        ],
      ),
    );
  }
}
