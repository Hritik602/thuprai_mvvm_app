import 'package:thuprai_mvvm_test/network/api_error.dart';
import 'package:thuprai_mvvm_test/network/network_common.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';

class HomeService {
  static const String apiEndpoints = "book/new-releases/";

  Future<NewBookReleaseModel> fetchAllNewReleaseBooks(int page) async {
    try {
      var res = await NetworkCommon.dio
          .get(apiEndpoints, queryParameters: _queryParam(page: page));
      return NewBookReleaseModel.fromJson(res.data);
    } catch (e) {
      return NewBookReleaseModel.withException(ApiError.fromDioError(e));
    }
  }

  static _queryParam({int? page}) {
    Map<String, dynamic> map = {};
    if (page != null) {
      map.addAll({"page": page});
    }
    return map;
  }
}
