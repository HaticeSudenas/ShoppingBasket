import 'package:flutter/material.dart';
import 'package:flutter_project_1/features/products/model/products_model.dart';
import 'package:flutter_project_1/product/model/user_model.dart';
import 'package:flutter_project_1/product/widget/card/shop_card.dart';
import 'package:provider/provider.dart';
import 'productcs_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildActionChipTotalMoney()],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ShopCard(product: Product(body: "vb ${index}",title: "10",userId: 10,id:"${index}"),);
          }),
    );
  }

  ActionChip buildActionChipTotalMoney() {
    return ActionChip(
      label: Text("${context.watch<UserModal>().basketTotalMoney}TL"),
      onPressed: () {},
      avatar: Icon(
        Icons.check,
        color: Colors.grey,
      ),
    );
  }
}
