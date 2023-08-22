import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';

abstract class HomeRepository {
  Future<NewBookReleaseModel> getAllNewBookReleaseList();
}
