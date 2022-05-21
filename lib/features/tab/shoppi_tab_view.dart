import 'package:flutter/material.dart';
import 'package:flutter_project_1/features/basket/basket.dart';
import 'package:flutter_project_1/features/products/products.dart';
import 'package:flutter_project_1/product/model/user_model.dart';
import 'package:provider/provider.dart';

class ShoppiTabView extends StatelessWidget {
  const ShoppiTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: buildBottomAppBar(context),
          body: TabBarView(children: [Products(), Basket()]),
        ));
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(
              icon: Stack(
            children:[
              Icon(Icons.shopping_basket),
              Positioned(
                  top: 0,
                  left: 10,
                  bottom: 10,
                  right: 0,
                  child: buildCircleAvatarCount(context))
            ],
          ))
        ],
        labelColor: Colors.black,
      ),
    );
  }

  CircleAvatar buildCircleAvatarCount(BuildContext context) {
    return CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("${context.watch<UserModal>().AllProduct()}",style: Theme.of(context).textTheme.overline?.copyWith(color: Colors.white),),
                );
  }
}
