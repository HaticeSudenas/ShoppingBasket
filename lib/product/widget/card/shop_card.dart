import 'package:flutter/material.dart';
import 'package:flutter_project_1/features/products/model/products_model.dart';
import 'package:flutter_project_1/product/model/user_model.dart';
import 'package:provider/provider.dart';

class ShopCard extends StatelessWidget {
  final Product product;
  const ShopCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing:
            IconButton(onPressed: () {
              context.read<UserModal>().addFirstProduct(product);
            }, icon: Icon(Icons.shopping_basket)),
        title: buildSizedBoxImage(context),
        subtitle: buildWrapCard(),
      ),
    );
  }

  Widget buildSizedBoxImage(BuildContext context) =>
   Column(
     children: [
       SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.network("https://picsum.photos/seed/picsum/200/300")),
        SizedBox(height:MediaQuery.of(context).size.height *0.01),
      Container(
        color:Colors.black12,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          IconButton(onPressed: () {
            context.read<UserModal>().incrementProduct(product);
          }, icon: Icon(Icons.add)),
          Text("${context.watch<UserModal>().basketProduct[product]??0}"),
          IconButton(onPressed: () {
            context.read<UserModal>().increaseProduct(product);
          }, icon: Icon(Icons.remove)),
        ],),
      )
     ],
   );

  Wrap buildWrapCard() {
    return Wrap(
      spacing: 10,
      children: [Text(product.title.toString()), Text(product.body.toString())],
    );
  }
}
