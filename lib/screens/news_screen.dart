import 'package:flutter/material.dart';
import 'package:newsapp_mvvm/constants/contant.dart';
import 'package:newsapp_mvvm/viewmodels/list_view_model.dart';
import 'package:newsapp_mvvm/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).getTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewmodel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            // Callback that sets the selected popup menu item.
            onSelected: (country) {
              listViewmodel.fetchNewsByCountry(Constant.countries[country]!);
            },
            itemBuilder: (BuildContext context) => Constant.countries.keys
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ],
        title: const Text("News App"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30, bottom: 15, top: 15),
            child: Text(
              "Headlines",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: NewsGrid(articles: listViewmodel.article),
          ),
        ],
      )),
    );
  }
}
