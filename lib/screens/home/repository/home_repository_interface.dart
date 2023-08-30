import 'package:thuprai_mvvm_test/screens/home/model/book_release_model.dart';

abstract class HomeRepository {
  Future<BookReleaseModel> getAllNewBookReleaseList(int page);
}
