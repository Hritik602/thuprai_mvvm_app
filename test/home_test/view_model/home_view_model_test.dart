import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_mvvm_test/screens/home/model/book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/view_model/home_view_model.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  MockHomeViewModel mockHomeViewModel = MockHomeViewModel();
  test('Test for fetching all new book release  from view model', () async {
    //[Arrange]
    when(mockHomeViewModel.getAllBooksNewRelease(1))
        .thenAnswer((realInvocation) => Future.value(BookReleaseModel()));

    final result = mockHomeViewModel.getAllBooksNewRelease(1);

    ///[Act]
    expect(result, isInstanceOf<Future<BookReleaseModel>>());
  });
}
