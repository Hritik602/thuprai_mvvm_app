import 'package:thuprai_mvvm_test/network/api_error.dart';
import 'package:thuprai_mvvm_test/network/network_common.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';

class HomeService {
  static const String apiEndpoints = "book/new-releases/";

  Future<NewBookReleaseModel> fetchAllNewReleaseBooks() async {
    try {
      var res = await NetworkCommon.dio.get(
        apiEndpoints,
      );
      return NewBookReleaseModel.fromJson(res.data);
    } catch (e) {
      return NewBookReleaseModel.withException(e as DioExceptions?);
    }
  }
}
