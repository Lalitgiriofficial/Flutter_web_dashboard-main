import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        color: Color.fromRGBO(1, 48, 101, 1.0),
        boxShadow: const [
        BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: Offset(0.0, -5.0),
    ),
    ],
    ),
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Flexible(
    flex: 2,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'About Us',
    style: TextStyle(
      color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    ),
    ),
    const SizedBox(height: 10.0),
    GestureDetector(
    onTap: () {
    // Handle Our Story button tap
    },
    child: Text(
    'Our Story',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    const SizedBox(height: 5.0),
    GestureDetector(
    onTap: () {
    // Handle Our Team button tap
    },
    child: Text(
    'Our Team',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    ],
    ),
    ),
    Flexible(
    flex: 1,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Legal',
    style: TextStyle(
      color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    ),
    ),
    const SizedBox(height: 10.0),
    GestureDetector(
    onTap: () {
    // Handle Privacy Policy button tap
    },
    child: Text(
    'Privacy Policy',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    const SizedBox(height: 5.0),
    GestureDetector(
    onTap: () {
    // Handle Terms and Conditions button tap
    },
    child: Text(
    'Terms and Conditions',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    ],
    ),
    ),
    Flexible(
    flex: 1,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Connect With Us',
    style: TextStyle(
      color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    ),
    ),
    const SizedBox(height: 10.0),
    Row(
    children: [
    GestureDetector(
    onTap: () {
    // Handle Facebook button tap
    },
    child: Container(
    padding: EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 12.0,
    ),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(5.0),
    ),
    child: Row(
    children: [
    Icon(
    FontAwesomeIcons.facebook,
    size: 16.0,
    color: Colors.white,
    ),
    SizedBox(width: 5.0),
    Text(
    'Facebook',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(width: 5.0),


    GestureDetector(
    onTap: () {
    // Handle Twitter button tap
    },
    child: Container(
    padding: EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 12.0,
    ),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(5.0),
    ),
    child: Row(
    children: [
    Icon(
    FontAwesomeIcons.instagram,
    size: 16.0,
    color: Colors.white,
    ),
    SizedBox(width: 5.0),
    Text(
    'Instagram',
    style: TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    )
    ],
    ),)
    ],
    ),
    ));
    }
}