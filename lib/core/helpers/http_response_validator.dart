class HttpResponseValidator {
  static bool isValidateStatusCode(int statusCode) {
    if(statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HttpException(statusCode: statusCode);
    }
  }
}

class HttpException implements Exception {
  final int statusCode;
  HttpException({required this.statusCode});

  @override
  String toString() {
    String message;
    switch(statusCode){
      case 400 : message = "Bad Request"; break;
      case 401 : message = "UnAuthorized"; break;
      case 403 : message = "ForBidden"; break;
      case 409 : message = "Conflict"; break;
      case 500 : message = "Internal Server Error"; break;
      default : message = "Unknown Error";
    }
    return "HttpException statusCode : $statusCode message : $message";
  }
}