import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<String> filters = [
    "Hair Stylist",
    "Spa",
    "Facial",
    "Bridal Make Up",
    "Nail Polish",
    "Hair Stylist",
    "Spa",
    "Facial"
  ];

   SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for Salon, Cosmetic ...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15 ,vertical: 16),
        child: Wrap(
          spacing: 5,
          runSpacing: 10,
          children: filters.map((filter) {
            return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      filter ,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
