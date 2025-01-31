import 'package:flutter/material.dart';
import 'package:salon_app/core/utils/navigator.dart';
import 'package:salon_app/core/utils/styles.dart';
import 'package:salon_app/data/amenities_data.dart';
import 'package:salon_app/data/salons_data.dart';
import 'package:salon_app/presentation/explore/widgets/salon_card.dart';
import 'package:salon_app/presentation/widgets/custom_button.dart';

class ServicesScreen extends StatefulWidget {
  final String text;
  const ServicesScreen({super.key, required this.text});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.text,),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: 
      ListView.builder(
        itemCount: SalonsData.list.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SalonCard(data: SalonsData.list[index], isFav: false),
        ),
      ),
    );
  }
}   
  void _showFilterBottomSheet(BuildContext context) { 
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    navigateBack(context);
                  }, icon: Icon(Icons.close)), 
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Reset', style: TextStyle(color: Colors.orange)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600 )),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '   Search for location',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)), 
                ),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.my_location, color: Colors.orange),
                label: const Text('Use current location', style: TextStyle(color: Colors.orange)),
              ),
              const SizedBox(height: 10),
              const Text('Price Range',style: TextStyle( fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Text('199'),
                  Spacer(),
                  Text('4999'),
                ],
              ),
              Slider(
                value: 2500,
                min: 199,
                max: 4999,
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Rating',style: TextStyle( fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Spacer(),
                  Text('4 Star'),
                ],
              ),  
              Slider(
                value: 4,
                min: 1,
                max: 5,
                divisions: 4,
                label: '4 Star',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              const Text('Amenities',style: TextStyle( fontWeight: FontWeight.w600),),
              Wrap(
        spacing: 10,
        runSpacing: 5,
        children: [
          for (var item in AmenitiesData.list)
            _buildAmenityButton(context, item),
        ],
      ),
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: CustomButton(
      title:'Apply Filters',
      onTap: null,
    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAmenityButton(BuildContext context, Map<String, dynamic> item) {
    return CustomButton(
      title: item['title'],
      leftIcon: item['icon'],
      color: ColorHelper.grey20Lite(context),
      textColor: ColorHelper.titleMediumColor(context),
      onTap: null,
    );
  } 

