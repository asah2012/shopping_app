import 'package:flutter/material.dart';
import 'package:shopping_app/provider/order_item.dart';

class OrderListWidget extends StatelessWidget {
  List<OrderItem> orderItemList;
  OrderListWidget(this.orderItemList);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            itemCount: orderItemList.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  ListTile(
                    //contentPadding: const EdgeInsets.symmetric(
                    //  vertical: 2, horizontal: 2.0),
                    leading: Text(
                      orderItemList[i].productItem.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    title: Text(
                        "Price : ${orderItemList[i].productItem.price} X ${orderItemList[i].qty}"),
                    trailing: Text(
                        " cost : \$${(orderItemList[i].productItem.price * orderItemList[i].qty).toStringAsFixed(2)}"),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  )
                ],
              );
            }));

    /* Container(
      child: Text("Total items in it is ${orderItemList.length}"),
    ); */
  }
}
