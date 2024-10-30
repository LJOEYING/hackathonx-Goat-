import 'package:flutter/material.dart';

class GreenMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: -5,
            right: 0,
            bottom: 20,
            child: Image.asset(
              'assets/recycle_centre_map.png',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            right: 0,
            child: SearchBar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CollectionTypeSelector(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Recycle Centre near me',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}

class CollectionTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final items = [
            {'label': 'Dustbin', 'photo': 'assets/dustbin.png'},
            {'label': 'Recycle Bin', 'photo': 'assets/recycle_bin.png'},
            {'label': 'Communal Bin', 'photo': 'assets/communal_bin.png'},
            {
              'label': 'Collection Centre',
              'photo': 'assets/collection_centre.png'
            },
            {'label': 'Recycle Centre', 'photo': 'assets/recycle_centre.png'},
            {
              'label': 'Mobile Recycling Centre',
              'photo': 'assets/mobile_recycle.png'
            },
          ];

          final label = items[index]['label']!;
          final photo = items[index]['photo']!;

          return _buildCollectionIcon(label, photo);
        },
      ),
    );
  }

  Widget _buildCollectionIcon(String label, String photo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.green[100],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
              height: 45,
              width: 45,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
