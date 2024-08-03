class ApiEndPoints {
  ApiEndPoints._();
  static const baseUrl = "https://watchstore.sasansafari.com";
  static const apiVersionRouting = "/public/api/v1";
  static const sendSms = "$baseUrl+$apiVersionRouting/send_sms";
  static const checkSmsCode = "$baseUrl+$apiVersionRouting/check_sms_code";
  static const register = "$baseUrl+$apiVersionRouting/register";

  static const getAllProduct = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.allProduct}";
  static const newestProducts = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.newestProducts}";
  static const cheapestProducts = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.cheapestProducts}";
  static const mostExpensiveProducts = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.mostExpensiveProducts}";
  static const mostViewedProducts = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.mostViewedProducts}";
  static const productsByCategory = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.productsByCategory}";
  static const productsByBrand = "$baseUrl+$apiVersionRouting/${_ProductApiRouting.productsByBrand}";
}

class _ProductApiRouting {
  static const allProduct = "all_products";
  static const newestProducts = "newest_products";
  static const cheapestProducts = "cheapest_products";
  static const mostExpensiveProducts = "most_expensive_products";
  static const mostViewedProducts = "most_viewed_products";
  static const productsByCategory = "products_by_category";
  static const productsByBrand = "products_by_brand";
}