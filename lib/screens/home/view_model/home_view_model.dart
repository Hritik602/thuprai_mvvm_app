import 'package:flutter/material.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final NewBooksReleaseRepository _homeRepository = NewBooksReleaseRepository();

  Future<NewBookReleaseModel> getAllBooksNewRelease() async {
    return _homeRepository.getAllNewBookReleaseList();
  }
}
