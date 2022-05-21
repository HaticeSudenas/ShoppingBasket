import 'package:flutter/cupertino.dart';
import 'package:flutter_project_1/features/products/model/products_model.dart';

class UserModal extends ChangeNotifier{
  Map<Product,int> basketProduct={};
  List<Product> get basketItems=>basketProduct.keys.toList();
  double get basketTotalMoney{
    if(basketProduct.isEmpty){
      return 0;
    }
    else{
      double _total=0;
      basketProduct.forEach((key, value) {
        if(key.userId!=null){
            _total+=key.userId!*value;
          }
          else{
            _total+=0;
          }
      });
      return _total;
    }
  }
  int AllProduct(){
    return basketProduct.length;
  }
  void addFirstProduct(Product product) {
    basketProduct[product]=1;
    notifyListeners();
  }
  void incrementProduct(Product product) {
    if(basketProduct[product]==null){
      addFirstProduct(product);
      return;
    }
    else{
      basketProduct[product] =basketProduct[product]!+1;
    }
    
    notifyListeners();
  }
  void increaseProduct(Product product) {
    if(basketProduct[product]==1){
      basketProduct.removeWhere((key, value) => key==product);
    }
    else{
      basketProduct[product] =basketProduct[product]!-1;
    }
    notifyListeners();
  }
}