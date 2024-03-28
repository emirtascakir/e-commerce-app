import 'package:e_commerce_mobile_app/constant/constant.dart';
import 'package:http/http.dart' as http;

class RemotePopularProductsService {
  final client = http.Client();
  final remoteUrl = '$baseUrl/api/popular-products';

  Future<dynamic> get() async {
    final response = await client
        .get(Uri.parse('$remoteUrl?populate=product,product.images'));
    return response;
  }
}
