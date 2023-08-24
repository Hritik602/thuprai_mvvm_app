import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuprai_mvvm_test/screens/home/model/new_book_release_model.dart';
import 'package:thuprai_mvvm_test/screens/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen"),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            minimum: const EdgeInsets.all(10),
            child: FutureBuilder(
              future: context.read<HomeViewModel>().getAllBooksNewRelease(),
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
                          return Text(newBookReleaseModel.results![index].title
                              .toString());
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
