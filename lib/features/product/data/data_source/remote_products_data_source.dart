import 'package:dio/dio.dart';
import 'package:flutter_online_shop_bloc/core/constants/api_end_points.dart';
import 'package:flutter_online_shop_bloc/core/helpers/http_response_validator.dart';
import 'package:flutter_online_shop_bloc/features/product/data/models/product_model.dart';

abstract class IRemoteProductsDataSource {
  Future<List<Product>> getAllProduct(String? searchKeyWord);
  Future<List<Product>> newestProducts();
  Future<List<Product>> cheapestProducts();
  Future<List<Product>> mostExpensiveProducts();
  Future<List<Product>> mostViewedProducts();
  Future<List<Product>> productsByCategory(int id);
  Future<List<Product>> productsByBrand(int id);
}

class RemoteProductsDataSource implements IRemoteProductsDataSource {
  final Dio httpClient;
  RemoteProductsDataSource(this.httpClient);
  
  @override
  Future<List<Product>> cheapestProducts() async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get(ApiEndPoints.cheapestProducts);
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> getAllProduct(String? searchKeyWord) async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get("${ApiEndPoints.getAllProduct}/$searchKeyWord");
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> mostExpensiveProducts() async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get(ApiEndPoints.mostExpensiveProducts);
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> mostViewedProducts() async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get(ApiEndPoints.mostViewedProducts);
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> newestProducts() async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get(ApiEndPoints.newestProducts);
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> productsByBrand(int id) async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get("${ApiEndPoints.productsByBrand}/$id");
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }

  @override
  Future<List<Product>> productsByCategory(int id) async {
    final List<Product> products = [];
    // send request
    final Response response = await httpClient.get("${ApiEndPoints.productsByCategory}/$id");
    // validate response
    HttpResponseValidator.isValidateStatusCode(response.statusCode!);
    // convert json to dart class
    for(var productJson in response.data["all_products"]["data"]){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }
}