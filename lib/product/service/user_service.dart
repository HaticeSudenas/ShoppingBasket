import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project_1/features/products/model/products_model.dart';
class UserService {
  late Dio dio;
  UserService(){
    dio=Dio(BaseOptions(baseUrl:"http://10.0.2.2:3000"));
  }
  List<Product> getAllProduct(){
     return [];
  }
  bool addProduct(){
    return true;
  }
}
