import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/service/home_service.dart';

import 'home_service_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  MockHomeService mockHomeService = MockHomeService();
  test('Test for fetching all new book release  ', () async {
    ///[Arrange]
    when(mockHomeService.fetchAllNewReleaseBooks(1))
        .thenAnswer((realInvocation) => Future.value(NewBookReleaseModel()));

    final result = mockHomeService.fetchAllNewReleaseBooks(1);

    ///[Act]
    expect(result, isInstanceOf<Future<NewBookReleaseModel>>());
  });
}
