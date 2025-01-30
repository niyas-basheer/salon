// import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';
// import 'package:salon_app/core/utils/global_methods.dart';
// import 'package:salon_app/data/salons_data.dart';
// import 'package:salon_app/presentation/explore/widgets/filter_widget.dart';
// import 'package:salon_app/presentation/explore/widgets/salon_card.dart';
// import 'package:salon_app/presentation/widgets/spacing.dart';

// /// ExplorePage displays the page for exploring salons.
// class ExplorePage extends StatefulWidget {
//   /// Constructor for the ExplorePage widget.
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             spacing(height: 8),
//             searchBar(),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: SalonsData.list.length,
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.only(bottom: 5),
//                   child: SalonCard(data: SalonsData.list[index]),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Builds the search bar widget.
//   Widget searchBar() {
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(LucideIcons.search),
//                   hintText: trans(context, key: 'search_salon_specialist'),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   isDismissible: true,
//                   isScrollControlled: true,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25),
//                     ),
//                   ),
//                   builder: (context) => const FilterWidget(),
//                 );
//               },
//               icon: const Icon(LucideIcons.slidersHorizontal),
//               tooltip: trans(context, key: 'filter'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:salon_app/presentation/explore/widgets/saurch_screen.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
                );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                filterLabels.length,
                (index) => GestureDetector(
                  onTap: () {
                    // Add filter functionality here
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      filterLabels[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Staggered Grid of Media Items
          Expanded(
            child: MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3 ), // Two columns
              itemCount: mediaItems.length,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0 ,
              itemBuilder: (context, index) {
                final item = mediaItems[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    
                    children: [
                      Image.asset(
                        item['image'] as String, 
                        fit: BoxFit.cover,
                      ),
                      if (item['isVideo'] == true)
                        const Positioned.fill(
          child: Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
     
    );
  }
}

// Sample data
final filterLabels = [
  'Nail Polish',
  'Hair Stylist',
  'Spa',
  'Facial',
  'Bridal Make Up',
  'Other'
];


final mediaItems = [
  {'image': 'assets/img/gallery/image-1.png', 'isVideo': true},
  {'image': 'assets/img/gallery/image-4.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-5.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-6.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-7.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-8.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-9.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-10.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-11.png', 'isVideo': false},
  {'image': 'assets/img/gallery/image-12.png', 'isVideo': false},
];
