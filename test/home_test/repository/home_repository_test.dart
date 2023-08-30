import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_mvvm_test/screens/home/model/book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/repository/home_repository.dart';

import 'home_repository_test.mocks.dart';

@GenerateMocks([NewBooksReleaseRepository])
void main() {
  MockNewBooksReleaseRepository mockNewBooksReleaseRepository =
      MockNewBooksReleaseRepository();
  test('Test home Repository method', () async {
    when(mockNewBooksReleaseRepository.getAllNewBookReleaseList(1))
        .thenAnswer((realInvocation) => Future.value(BookReleaseModel()));

    final result = mockNewBooksReleaseRepository.getAllNewBookReleaseList(1);

    expect(result, isInstanceOf<Future<BookReleaseModel>>());
  });
}
