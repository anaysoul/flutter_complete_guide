import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount}',
                    style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    child: Text('ORDER NOW'))
              ],
            ),
          ),
        ),
        SizedBox(),
        Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, i) => CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i], //productId
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title,
                    )))
      ]),
    );
  }
}
