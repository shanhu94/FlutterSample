import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

enum RefreshType {
  preLoading,
  loading,
  finishLoading,
}

class RefreshListView extends StatefulWidget {
  final Widget Function(RefreshType type) header;
  double headerRefreshHeight;
  Future<void> Function() headerRefresh;
  final Widget Function(RefreshType type) footer;
  double footerRefreshHeight;
  Future<void> Function() footerRefresh;
  int itemCount;
  NullableIndexedWidgetBuilder itemBuilder;
  final ScrollController? controller;
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  RefreshListView({
    super.key,
    required this.header,
    this.headerRefreshHeight = 50,
    required this.headerRefresh,
    required this.footer,
    this.footerRefreshHeight = 50,
    required this.footerRefresh,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  @override
  State<StatefulWidget> createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView>
    with SingleTickerProviderStateMixin {
  late ScrollController _controller;
  double _headerTopOffset = 0;
  RefreshType _headerRefreshType = RefreshType.preLoading;
  double _footerBottomOffset = 0;
  RefreshType _footerRefreshType = RefreshType.preLoading;

  bool _touch = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
      _controller.addListener(_onScrollEvent);
    } else {
      _controller = ScrollController(initialScrollOffset: 0.001);
      _controller.addListener(_onScrollEvent);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  void _setHeaderRefreshType(RefreshType type) {
    if (_headerRefreshType == type) {
      return;
    }
    setState(() {
      _headerRefreshType = type;
    });
  }

  void _invokeRefreshHeader() async {
    _setHeaderRefreshType(RefreshType.loading);
    await widget.headerRefresh();
    _setHeaderRefreshType(RefreshType.finishLoading);
    setState(() {
      _headerTopOffset = 0;
    });
  }

  void _setFooterRefreshType(RefreshType type) {
    if (_footerRefreshType == type) {
      return;
    }
    setState(() {
      _footerRefreshType = type;
    });
  }

  void _invokeRefreshFooter() async {
    _setFooterRefreshType(RefreshType.loading);
    await widget.footerRefresh();
    _setFooterRefreshType(RefreshType.finishLoading);
    setState(() {
      _footerBottomOffset = 0;
    });
  }

  void _onScrollEvent() {
    if (_controller.offset < 0) {
      setState(() {
        if (_headerRefreshType == RefreshType.preLoading) {
          _headerTopOffset = -_controller.offset;
          if (!_touch && _headerTopOffset > widget.headerRefreshHeight) {
            _invokeRefreshHeader();
          }
        } else if (_headerRefreshType == RefreshType.loading) {
          _headerTopOffset =
              max(-_controller.offset, widget.headerRefreshHeight);
        } else if (_headerRefreshType == RefreshType.finishLoading) {
          _setHeaderRefreshType(RefreshType.preLoading);
        }
      });
    } else if (_controller.offset > _controller.position.maxScrollExtent) {
      setState(() {
        if (_footerRefreshType == RefreshType.preLoading) {
          _footerBottomOffset =
              _controller.offset - _controller.position.maxScrollExtent;
          if (!_touch && _footerBottomOffset > widget.footerRefreshHeight) {
            _invokeRefreshFooter();
          }
        } else if (_footerRefreshType == RefreshType.loading) {
          _footerBottomOffset = max(
              _controller.offset - _controller.position.maxScrollExtent,
              widget.footerRefreshHeight);
        } else if (_footerRefreshType == RefreshType.finishLoading) {
          _setFooterRefreshType(RefreshType.preLoading);
        }
      });
    }
  }

  void _onPointerDown(event) {
    _touch = true;
  }

  void _onPointerUp(event) {
    _touch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
            keyboardDismissBehavior: widget.keyboardDismissBehavior,
          ),
          Positioned(
            top: -widget.headerRefreshHeight + _headerTopOffset,
            left: 0,
            right: 0,
            height: widget.headerRefreshHeight,
            child: widget.header(_headerRefreshType),
          ),
          Positioned(
            bottom: -widget.footerRefreshHeight + _footerBottomOffset,
            left: 0,
            right: 0,
            height: widget.footerRefreshHeight,
            child: widget.footer(_footerRefreshType),
          ),
        ],
      ),
    );
  }
}
