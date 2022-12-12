import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/model/cart_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          children: [
            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = value.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            cartItem[2],
                            height: 36,
                          ),
                          title: Text(
                            cartItem[0],
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            "\$${cartItem[1]}",
                            style: const TextStyle(fontSize: 13),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItem(index);
                              // item remove successfully
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                   duration: const Duration(seconds: 1),
                                  content: Text("${cartItem[0]} removed successfully"),
                                ),
                              );

                            },

                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
