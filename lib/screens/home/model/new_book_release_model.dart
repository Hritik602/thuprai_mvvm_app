import 'package:dio/dio.dart';
import 'package:thuprai_mvvm_test/network/api_error.dart';

class NewBookReleaseModel {
  Pagination? pagination;
  List<Result>? results;
  ApiError? dioExceptions;
  NewBookReleaseModel({
    this.pagination,
    this.results,
  });
  NewBookReleaseModel.withException(this.dioExceptions);
  factory NewBookReleaseModel.fromJson(Map<String, dynamic> json) =>
      NewBookReleaseModel(
        pagination: Pagination.fromJson(json["pagination"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Pagination {
  final int? count;
  final int? page;
  final int? pages;
  final dynamic? previous;
  final String? next;
  final int? size;

  Pagination({
    this.count,
    this.page,
    this.pages,
    this.previous,
    this.next,
    this.size,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        page: json["page"],
        pages: json["pages"],
        previous: json["previous"],
        next: json["next"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page": page,
        "pages": pages,
        "previous": previous,
        "next": next,
        "size": size,
      };
}

class Result {
  final String? title;
  final String? englishTitle;
  final String? slug;
  final String? frontCover;

  Result({
    this.title,
    this.englishTitle,
    this.slug,
    this.frontCover,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        englishTitle: json["english_title"],
        slug: json["slug"],
        frontCover: json["front_cover"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "english_title": englishTitle,
        "slug": slug,
        "front_cover": frontCover,
      };
}
