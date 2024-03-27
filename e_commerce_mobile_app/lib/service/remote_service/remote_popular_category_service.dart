import 'package:e_commerce_mobile_app/constant/constant.dart';
import 'package:http/http.dart' as http;

class RemotePopularCategoryService {
  final client = http.Client();
  final remoteUrl = '$baseUrl/api/popular-categories';

  Future<dynamic> get() async {
    final response = await client
        .get(Uri.parse('$remoteUrl?populate=category,category.image'));
    return response;
  }
}
