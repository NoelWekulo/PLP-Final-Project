import 'package:flutter/material.dart';
import 'data.dart'; // Import the dummy data model
import 'donation_item_widget.dart'; // Import the DonationItemWidget
import 'donate_screen.dart'; // Import the DonateScreen

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category: ${category.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DonateScreen(category: category.name)),
              );
            },
            tooltip: 'Donate Item',
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: category.items.length,
        itemBuilder: (context, index) {
          return DonationItemWidget(item: category.items[index]);
        },
      ),
    );
  }
}

