import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/model/cart_model.dart';
import 'package:grocery_store/widgets/grocery_item.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good morning,'),
            ),
            const SizedBox(height: 4),

            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 24),
            // categories -> horizontal listview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: GoogleFonts.notoSerif(
                  //fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // recent orders -> show last 3
            Expanded(
                child: Consumer<CartModel>(
              builder: (context, value, child) => GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  final shopItem = value.shopItems[index];
                  return GroceryItem(
                    itemName: shopItem[0],
                    itemPrice: shopItem[1],
                    imagePath: shopItem[2],
                    color: shopItem[3],
                    onPressed: () {},
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
