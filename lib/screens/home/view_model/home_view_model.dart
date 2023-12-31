import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/screens/home/model/book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final NewBooksReleaseRepository _homeRepository = NewBooksReleaseRepository();

  Future<BookReleaseModel> getAllBooksNewRelease(int page) async {
    return _homeRepository.getAllNewBookReleaseList(page);
  }
}
