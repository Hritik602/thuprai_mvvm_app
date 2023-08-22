import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/screens/book_release/view_model/book_release_view_model.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';

class BookRelease extends StatefulWidget {
  const BookRelease({super.key});

  @override
  State<BookRelease> createState() => _BookReleaseState();
}

class _BookReleaseState extends State<BookRelease> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookReleaseViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Book Release Screen"),
          ),
          body: SafeArea(
            child: FutureBuilder(
              future:
                  context.read<BookReleaseViewModel>().getAllBooksNewRelease(),
              builder: (BuildContext context,
                  AsyncSnapshot<NewBookReleaseModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    NewBookReleaseModel newBookReleaseModel =
                        snapshot.data as NewBookReleaseModel;
                    return ListView.builder(
                        itemCount: newBookReleaseModel.results?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(newBookReleaseModel
                                .results![index].title
                                .toString()),
                          );
                        });
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
