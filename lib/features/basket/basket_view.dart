import 'package:flutter/material.dart';
import 'package:flutter_project_1/features/products/model/products_model.dart';
import 'package:flutter_project_1/product/model/user_model.dart';
import 'package:provider/provider.dart';

import 'basket_view_modal.dart';

class BasketView extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: basketListView(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              basketMoney(context),
              BasketBuy()
            ],
          )
        ],
      ),
    );
  }

  ListView basketListView(BuildContext context) {
    return ListView.builder(
          itemBuilder: (context, index) {
            final product = context.watch<UserModal>().basketItems[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: basketCard(product, context),
            );
          },
          itemCount: context.watch<UserModal>().basketItems.length,
        );
  }

  RaisedButton BasketBuy() {
    return RaisedButton(
              onPressed: () {},
              child: Text("Buy All"),
            );
  }

  Container basketMoney(BuildContext context) {
    return Container(
              child: Text("${context.watch<UserModal>().basketTotalMoney} TL",style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.blueGrey),),
            );
  }

  Card basketCard(Product product, BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: basketCardColumn(product, context),
      ),
    );
  }

  Column basketCardColumn(Product product, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "id: ${product.id}",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Name: ${product.body}",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Fiyat: ${product.userId}",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
