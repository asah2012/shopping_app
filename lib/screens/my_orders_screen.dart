import 'package:flutter/material.dart';
import '../provider/order_list.dart';
import 'package:shopping_app/widgets/drawer_shoppingApp.dart';

import '../provider/order.dart';
import '../widgets/orderlist_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  static String route = '/myOrderScreen';

  @override
  Widget build(BuildContext context) {
    List<Order> myOrderList = OrderList.customerOrderList;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "My Orders",
        style: Theme.of(context).textTheme.titleLarge,
      )),
      drawer: DrawerShoppingApp(),
      body: /* Container(
          child: Text("OrderList has ${myOrderList[0].orderKey} items")), */
          ListView.builder(
              itemCount: myOrderList.length,
              itemBuilder: (ctx, index) {
                return SingleOrderTile(myOrderList[index]);
              }),
    );
  }
}

class SingleOrderTile extends StatefulWidget {
  const SingleOrderTile(
    this.myOrder,
  );

  final Order myOrder;

  @override
  State<SingleOrderTile> createState() => _SingleOrderTileState();
}

class _SingleOrderTileState extends State<SingleOrderTile> {
  bool _showOrderItems = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_showOrderItems)
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            tileColor: Colors.amberAccent,
            leading: Text("Order# ${widget.myOrder.orderKey}"),
            title: Text(
              "\$${widget.myOrder.orderValue}      Units : ${widget.myOrder.orderUnits} ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () => setState(() {
                _showOrderItems = !_showOrderItems;
              }),
            ),
          ),
        if (_showOrderItems)
          ListTile(
            leading: Text("Order# ${widget.myOrder.orderKey}"),
            title: Text(
              "\$${widget.myOrder.orderValue}      Units : ${widget.myOrder.orderUnits} ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_less),
              onPressed: () => setState(() {
                _showOrderItems = !_showOrderItems;
              }),
            ),
          ),
        if (_showOrderItems) OrderListWidget(widget.myOrder.orderItemList),
        Divider(
          color: Colors.grey,
          thickness: 2.0,
        )
      ],
    );
  }
}
