import 'package:flutter/material.dart';
import 'package:health_flex/app/utils/enums.dart';

class PaginatedView extends StatefulWidget {
  final VoidCallback reloadData;
  final Widget child;
  final bool hasMoreData;
  final PaginatedWidgetState paginatedWidgetState;

  const PaginatedView({
    super.key,
    required this.reloadData,
    required this.child,
    required this.hasMoreData,
    required this.paginatedWidgetState,
  });

  @override
  State<PaginatedView> createState() => _PaginatedViewState();
}

class _PaginatedViewState extends State<PaginatedView> {
  ScrollController scrollController = ScrollController();

  bool showLoader = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.hasClients &&
          widget.hasMoreData &&
          scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          ((widget.paginatedWidgetState == PaginatedWidgetState.loading) ||
              (widget.paginatedWidgetState ==
                  PaginatedWidgetState.paginationLoading))) {
        widget.reloadData();
        showLoader = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        widget.child,
        SizedBox(height: 20),
        if (showLoader)
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(color: Colors.black),
          ),
      ],
    );
  }
}
