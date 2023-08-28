// Mocks generated by Mockito 5.4.2 from annotations
// in thuprai_mvvm_test/test/home_test/service/home_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart'
    as _i2;
import 'package:thuprai_mvvm_test/screens/home/service/home_service.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewBookReleaseModel_0 extends _i1.SmartFake
    implements _i2.NewBookReleaseModel {
  _FakeNewBookReleaseModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeService extends _i1.Mock implements _i3.HomeService {
  MockHomeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.NewBookReleaseModel> fetchAllNewReleaseBooks(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchAllNewReleaseBooks,
          [page],
        ),
        returnValue: _i4.Future<_i2.NewBookReleaseModel>.value(
            _FakeNewBookReleaseModel_0(
          this,
          Invocation.method(
            #fetchAllNewReleaseBooks,
            [page],
          ),
        )),
      ) as _i4.Future<_i2.NewBookReleaseModel>);
}
