import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/screens/home/model/book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/view_model/home_view_model.dart';
import 'package:thuprai_mvvm_test/screens/home/widget/book_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<int, Books> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: PagedListView<int, Books>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Books>(
                itemBuilder: (context, item, index) =>
                    BookListTile(books: item)),
          )),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      BookReleaseModel books =
          await context.read<HomeViewModel>().getAllBooksNewRelease(pageKey);

      final isLastPage = books.pagination?.pages == books.pagination?.page;
      if (isLastPage) {
        _pagingController.appendLastPage(books.results!);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(books.results!, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
