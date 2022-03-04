import 'package:flutter/material.dart';
import 'dart:math';

class CustomGridView extends StatefulWidget {
  final int columnsCount;
  final List<Widget> children;
  final double verticalPadding;
  final double horizontalPadding;

  const CustomGridView({
    Key key,
    this.columnsCount,
    this.children,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  double widthOfItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalPadding = (widget.columnsCount + 1) * widget.horizontalPadding;
    widthOfItem = ((MediaQuery.of(context).size.width - totalPadding) /
            widget.columnsCount) -
        10;
    return Column(
      children: [
        for (int i = 0; i < widget.children.length; i += widget.columnsCount)
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
            child: Row(
              children: [
                for (int j = i;
                    j < min(i + widget.columnsCount, widget.children.length);
                    j++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.horizontalPadding),
                    child: SizedBox(
                      width: widthOfItem,
                      child: widget.children[j],
                    ),
                  )
              ],
            ),
          )
      ],
    );
  }
}
