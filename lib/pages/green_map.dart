import 'package:flutter/material.dart';

class GreenMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -70,
            left: -5,
            right: 0,
            bottom: 20,
            child: Image.asset(
              'assets/green_map.png',
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
            bottom: -20,
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
          hintText: 'Search anywhere nearby...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class CollectionTypeSelector extends StatelessWidget {
  final items = [
    {
      'label': 'Dustbins',
      'photo': 'assets/dustbin.png',
      'color': Colors.red[200]
    },
    {
      'label': 'Recycle Bins',
      'photo': 'assets/recycle_bin.png',
      'color': Colors.orange[300]
    },
    {
      'label': 'Communal Bins',
      'photo': 'assets/communal_bin.png',
      'color': Colors.yellow[300]
    },
    {
      'label': 'Collection Centres',
      'photo': 'assets/collection_center.png',
      'color': Colors.green[200]
    },
    {
      'label': 'Recycle Centres',
      'photo': 'assets/recycle_center.png',
      'color': Colors.blue[200]
    },
    {
      'label': 'Mobile Recycling Centres',
      'photo': 'assets/mobile_recycle_center.png',
      'color': Colors.purple[200]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final label = items[index]['label']! as String;
          final photo = items[index]['photo']! as String;
          final color = items[index]['color']! as Color;
          return _buildCollectionIcon(label, photo, color);
        },
      ),
    );
  }

  Widget _buildCollectionIcon(String label, String photo, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: color,
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
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
