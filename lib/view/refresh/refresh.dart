import 'package:flutter/material.dart';
import 'package:product_browser/vendor/refresh_list/refresh_list_view.dart';

class RefreshHeader extends StatelessWidget {
  final RefreshType type;
  const RefreshHeader(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final Widget widget;
    if (type == RefreshType.preLoading) {
      widget = Text("Header PreLoading");
    } else if (type == RefreshType.loading) {
      widget = Text("Header Loading");
    } else {
      widget = Text("Header Finished");
    }
    return Container(
        color: Theme.of(context).colorScheme.background,
        alignment: AlignmentDirectional.center,
        child: widget);
  }
}

class RefreshFooter extends StatelessWidget {
  final RefreshType type;
  const RefreshFooter(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    final Widget widget;
    if (type == RefreshType.preLoading) {
      widget = const Text("Footer PreLoading");
    } else if (type == RefreshType.loading) {
      widget = const Text("Footer Loading");
    } else {
      widget = const Text("Footer Finished");
    }
    return Container(
        color: Theme.of(context).colorScheme.background,
        alignment: AlignmentDirectional.center,
        child: widget);
  }
}