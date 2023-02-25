import 'package:flutter/material.dart';
import 'package:product_browser/model/home/home_list_model.dart';
import 'package:product_browser/model/home_detail/home_comment.dart';
import 'package:product_browser/view/home_detail/home_detail_comment_cell.dart';
import 'package:product_browser/view_model/home_detail_vm.dart';

class HomeDetailView extends StatefulWidget {
  final HomeListModel model;
  const HomeDetailView({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  List<HomeComment> comments = [];
  HomeListModel? model;
  HomeDetailVM vm = HomeDetailVM();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await vm.requestData();
    if (vm.content != null) {
      setState(() {
        model = vm.content;
      });
    }
    if (vm.comments != null) {
      setState(() {
        comments = vm.comments!;   
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: model == null ? emptyView(context) : comment(context),
      ),
    );
  }

  Widget emptyView(BuildContext context) {
    return Text('data');
  }

  Widget comment(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: const EdgeInsets.all(5),
            color: Theme.of(context).colorScheme.background,
            child: Text(
              model!.content,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          );
        } else if (index == 1) {
          return Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            padding:
                const EdgeInsets.only(left: 11, top: 8, bottom: 8, right: 11),
            child: Text(
              "评论区",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          );
        } else {
          var comment = comments[index - 2];
          return HomeDetailCommentCell(comment: comment);
        }
      },
    );
  }
}
