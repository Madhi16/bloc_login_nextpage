import 'package:flutter/cupertino.dart';
import 'api_service.dart';

class ApiRepository {
  final apiProvider = ApiService();

  Future loginload(
      BuildContext context,
      email,
      password
      ) {
    return apiProvider.loginload(
        context,
        email,
        password
    );
  }
  Future listload(

      ) {
    return apiProvider.listload(
    );
  }
}