import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/repository/home_repository_interface.dart';
import 'package:thuprai_mvvm_test/screens/home/service/home_service.dart';

class NewBooksReleaseRepository extends HomeRepository {
  final HomeService _homeService = HomeService();

  @override
  Future<BookReleaseModel> getAllNewBookReleaseList(int page) async {
    return await _homeService.fetchAllNewReleaseBooks(page);
  }
}
