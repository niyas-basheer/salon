// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:salon_app/presentation/home/widgets/filter.dart';

class MyWidgetState extends State<filter> {
 List<String> categories = ['Hair', 'Facial', 'Waxing', 'Mani-Pedi'];

  int selectedIndex = 0; 
 // Default selected index
  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(widget.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                             ),
               
                             // Service Categories
                             SizedBox(
                         height: 42, // Set fixed height for horizontal scrolling
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           padding: const EdgeInsets.symmetric(horizontal: 16),
                           itemCount: categories.length,
                           itemBuilder: (context, index) {
                             bool isSelected = index == selectedIndex;
                             return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.orange : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.orange : Colors.grey[300]!,
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.bold ,
                    ),
                  ),
                ),
                             );
                           },
                         ),
                       ),
               
                ]
               );
  }
}