import 'package:flutter/material.dart';

class DonationItem {
  final String name;
  final String description;
  final bool available;
  final String location;
  final String imageUrl;

  DonationItem({
    required this.name,
    required this.description,
    required this.available,
    required this.location,
    required this.imageUrl,
  });
}

class Category {
  final String name;
  final String imageUrl;
  final List<DonationItem> items;

  Category({
    required this.name,
    required this.imageUrl,
    required this.items,
  });
}

final List<Category> categories = [
  Category(
    name: 'Clothing',
    imageUrl: 'assets/images/clothes_main.jpg', // Image for the Clothes category
    items: [
      DonationItem(
        name: 'Clothes',
        description: 'Donate your gently used clothes today to support those in need, or contact us if you require clothing assistance',
        available: true,
        location: 'Main Street',
        imageUrl: 'assets/images/other1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Clothes',
        description: 'Donate your gently used clothes today to support those in need, or contact us if you require clothing assistance',
        available: true,
        location: 'Central Avenue',
        imageUrl: 'assets/images/other2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Clothes',
        description: 'Donate your gently used clothes today to support those in need, or contact us if you require clothing assistance',
        available: true,
        location: 'Central Avenue',
        imageUrl: 'assets/images/other3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Jeans',
        description: 'Donate your gently used clothes today to support those in need, or contact us if you require clothing assistance',
        available: true,
        location: 'Central Avenue',
        imageUrl: 'assets/images/other4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Foods',
    imageUrl: 'assets/images/food_main.jpg', // Image for the Foods category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Help fight hunger by donating non-perishable food items, or reach out to us if you need food assistance.',
        available: true,
        location: 'Farmers Market',
        imageUrl: 'assets/images/mob1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Help fight hunger by donating non-perishable food items, or reach out to us if you need food assistance.',
        available: true,
        location: 'Local Bakery',
        imageUrl: 'assets/images/mob2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Help fight hunger by donating non-perishable food items, or reach out to us if you need food assistance.',
        available: true,
        location: 'Central Avenue',
        imageUrl: 'assets/images/mob3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Help fight hunger by donating non-perishable food items, or reach out to us if you need food assistance.',
        available: true,
        location: 'Central Avenue',
        imageUrl: 'assets/images/mob4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  // Add other categories in the same way
  Category(
    name: 'Medical Equipments',
    imageUrl: 'assets/images/medical_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Support health and wellness by donating medical equipment, or contact us if you need medical supplies.',
        available: true,
        location: 'Pharmacy',
        imageUrl: 'assets/images/kitchen4.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Support health and wellness by donating medical equipment, or contact us if you need medical supplies.',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/build1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Support health and wellness by donating medical equipment, or contact us if you need medical supplies.',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/build2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Support health and wellness by donating medical equipment, or contact us if you need medical supplies.',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/build3.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Beddings',
    imageUrl: 'assets/images/bedding_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Ibuprofen tablets',
        available: true,
        location: 'Pharmacy',
        imageUrl: 'assets/images/foot4.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Assorted sizes bandages',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/kitchen1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Assorted sizes bandages',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/kitchen2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Assorted sizes bandages',
        available: false,
        location: 'Medical Store',
        imageUrl: 'assets/images/kitchen3.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Furniture',
    imageUrl: 'assets/images/furniture_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Help furnish homes by donating furniture, or reach out to us if you require furniture assistance.',
        available: true,
        location: 'Kasarani',
        imageUrl: 'assets/images/sup4.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Help furnish homes by donating furniture, or reach out to us if you require furniture assistance.',
        available: true,
        location: 'Ruiru',
        imageUrl: 'assets/images/foot2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Help furnish homes by donating furniture, or reach out to us if you require furniture assistance.',
        available: true,
        location: 'Embakasi',
        imageUrl: 'assets/images/foot3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Help furnish homes by donating furniture, or reach out to us if you require furniture assistance.',
        available: false,
        location: 'Nakuru',
        imageUrl: 'assets/images/fun4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Electronics',
    imageUrl: 'assets/images/elec5.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Electronic1',
        description: 'Give your old electronics a new life by donating them, or let us know if you need electronic devices.',
        available: true,
        location: 'Technology Resource Cente',
        imageUrl: 'assets/images/elec1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Electronic2',
        description: 'Give your old electronics a new life by donating them, or let us know if you need electronic devices.',
        available: false,
        location: 'Technology Resource Cente',
        imageUrl: 'assets/images/sup2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Electronic3',
        description: 'Give your old electronics a new life by donating them, or let us know if you need electronic devices.',
        available: true,
        location: 'Technology Resource Cente',
        imageUrl: 'assets/images/sup3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Electronic4',
        description: 'Give your old electronics a new life by donating them, or let us know if you need electronic devices.',
        available: true,
        location: 'Technology Resource Cente',
        imageUrl: 'assets/images/elec4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Baby Supplies',
    imageUrl: 'assets/images/baby_supply_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Supply1',
        description: 'Help families in need by donating baby supplies, or contact us if you require baby essentials.',
        available: true,
        location: 'Drop off baby supplies at our Family Resource Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/baby1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Supply2',
        description: 'Help families in need by donating baby supplies, or contact us if you require baby essentials.',
        available: true,
        location: 'Drop off baby supplies at our Family Resource Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/elec2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Supply3',
        description: 'Help families in need by donating baby supplies, or contact us if you require baby essentials.',
        available: true,
        location: 'Drop off baby supplies at our Family Resource Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/elec3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Supply4',
        description: 'Help families in need by donating baby supplies, or contact us if you require baby essentials.',
        available: true,
        location: 'Drop off baby supplies at our Family Resource Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/fun4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Footwear',
    imageUrl: 'assets/images/footwear_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Shoe1',
        description: 'Donate new or gently used footwear to support those in need, or reach out to us if you require shoes.',
        available: true,
        location: 'Drop off footwear at our Community Outreach Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/footwear1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Shoe2',
        description: 'Donate new or gently used footwear to support those in need, or reach out to us if you require shoes.',
        available: false,
        location: 'Drop off footwear at our Community Outreach Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/fun1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Donate new or gently used footwear to support those in need, or reach out to us if you require shoes.',
        available: false,
        location: 'Drop off footwear at our Community Outreach Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/fun2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Donate new or gently used footwear to support those in need, or reach out to us if you require shoes.',
        available: false,
        location: 'Drop off footwear at our Community Outreach Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/fun4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Kitchenware',
    imageUrl: 'assets/images/kitchen_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Donate kitchenware to help families in need, or contact us if you require kitchen essentials.',
        available: true,
        location: 'Drop off kitchenware at our Household Goods Donation Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/bed1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Donate kitchenware to help families in need, or contact us if you require kitchen essentials.',
        available: false,
        location: 'Drop off kitchenware at our Household Goods Donation Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/bed2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Donate kitchenware to help families in need, or contact us if you require kitchen essentials.',
        available: false,
        location: 'Drop off kitchenware at our Household Goods Donation Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/bed3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Donate kitchenware to help families in need, or contact us if you require kitchen essentials.',
        available: false,
        location: 'Drop off kitchenware at our Household Goods Donation Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/bed4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Building Materials',
    imageUrl: 'assets/images/building_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Donate building materials to support community projects and those in need, or reach out to us if you require construction supplies.',
        available: true,
        location: 'Drop off building materials at our Habitat for Humanity ReStore, or visit us if you need assistance.',
        imageUrl: 'assets/images/med3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Donate building materials to support community projects and those in need, or reach out to us if you require construction supplies.',
        available: true,
        location: 'Drop off building materials at our Habitat for Humanity ReStore, or visit us if you need assistance.',
        imageUrl: 'assets/images/build2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Donate building materials to support community projects and those in need, or reach out to us if you require construction supplies.',
        available: true,
        location: 'Drop off building materials at our Habitat for Humanity ReStore, or visit us if you need assistance.',
        imageUrl: 'assets/images/build3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Donate building materials to support community projects and those in need, or reach out to us if you require construction supplies.',
        available: true,
        location: 'Drop off building materials at our Habitat for Humanity ReStore, or visit us if you need assistance.',
        imageUrl: 'assets/images/sup1.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Personal Hygiene Products',
    imageUrl: 'assets/images/personal_hygiene_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Product1',
        description: 'Donate personal hygiene products to support those in need, or contact us if you require hygiene essentials',
        available: true,
        location: 'Drop off personal hygiene products at our Community Health Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/pro1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Product2',
        description: 'Donate personal hygiene products to support those in need, or contact us if you require hygiene essentials',
        available: true,
        location: 'Drop off personal hygiene products at our Community Health Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/pro2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Product3',
        description: 'Donate personal hygiene products to support those in need, or contact us if you require hygiene essentials',
        available: true,
        location: 'Drop off personal hygiene products at our Community Health Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/pro3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Product4',
        description: 'Donate personal hygiene products to support those in need, or contact us if you require hygiene essentials',
        available: true,
        location: 'Drop off personal hygiene products at our Community Health Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/pro4.jpg', // Example image for an item
      ),
    
      // Add more items here
    ],
  ),
  Category(
    name: 'Mobility aids',
    imageUrl: 'assets/images/mobility_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Donate mobility aids to help those in need, or reach out to us if you require mobility equipment.',
        available: true,
        location: 'Drop off mobility aids at our Assistive Devices Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/food1.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Donate mobility aids to help those in need, or reach out to us if you require mobility equipment.',
        available: false,
        location: 'Drop off mobility aids at our Assistive Devices Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/food2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Donate mobility aids to help those in need, or reach out to us if you require mobility equipment.',
        available: false,
        location: 'Drop off mobility aids at our Assistive Devices Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/food3.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Donate mobility aids to help those in need, or reach out to us if you require mobility equipment.',
        available: false,
        location: 'Drop off mobility aids at our Assistive Devices Center, or visit us if you need assistance.',
        imageUrl: 'assets/images/food4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  Category(
    name: 'Others',
    imageUrl: 'assets/images/other_main.jpg', // Image for the Medicine category
    items: [
      DonationItem(
        name: 'Item1',
        description: 'Donate various items to support those in need, or contact us if you require specific assistance.',
        available: true,
        location: 'Drop off miscellaneous donations at our Community Support Hub, or visit us if you need help.',
        imageUrl: 'assets/images/food4.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item2',
        description: 'Donate various items to support those in need, or contact us if you require specific assistance.',
        available: true,
        location: 'Drop off miscellaneous donations at our Community Support Hub, or visit us if you need help.',
        imageUrl: 'assets/images/med2.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item3',
        description: 'Donate various items to support those in need, or contact us if you require specific assistance.',
        available: false,
        location: 'Drop off miscellaneous donations at our Community Support Hub, or visit us if you need help.',
        imageUrl: 'assets/images/build4.jpg', // Example image for an item
      ),
      DonationItem(
        name: 'Item4',
        description: 'Donate various items to support those in need, or contact us if you require specific assistance.',
        available: false,
        location: 'Drop off miscellaneous donations at our Community Support Hub, or visit us if you need help.',
        imageUrl: 'assets/images/med4.jpg', // Example image for an item
      ),
      // Add more items here
    ],
  ),
  // Continue with other categories like beddingItems, furnitureItems, etc.
];