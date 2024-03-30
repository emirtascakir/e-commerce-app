import 'package:e_commerce_mobile_app/constant/constant.dart';
import 'package:http/http.dart' as http;

class RemoteProductService {
  final client = http.Client();
  final remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    final response =
        await client.get(Uri.parse('$remoteUrl?populate=images,tags'));
    return response;
  }
}
