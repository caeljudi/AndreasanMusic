import 'dart:ui';

import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
    this.selectedColor,
    this.selectedSize,
  }) : super(key: key);

  final List<CustomBottomNavigationBarItems> items;
  final Function(int) onTap;
  final int selectedIndex;

  final Color? selectedColor;
  final double? selectedSize;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Theme.of(context).appTheme.colors.primary.light,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, -2),
              blurRadius: 2,
              spreadRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.map(
          (CustomBottomNavigationBarItems item) {
            return InkWell(
              onTap: () => widget.onTap(widget.items.indexOf(item)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: DrawCustomBottomNavigationBarItems(
                  hideText:
                      item == widget.items[widget.selectedIndex] ? true : false,
                  item: item,
                  selectedColor: item == widget.items[widget.selectedIndex]
                      ? widget.selectedColor
                      : Colors.black,
                  selectedSize: item == widget.items[widget.selectedIndex]
                      ? widget.selectedSize
                      : null,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class DrawCustomBottomNavigationBarItems extends StatelessWidget {
  final CustomBottomNavigationBarItems item;
  final Color? selectedColor;
  final double? selectedSize;

  final bool hideText;

  const DrawCustomBottomNavigationBarItems({
    Key? key,
    this.selectedColor,
    required this.item,
    this.selectedSize,
    required this.hideText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          item.icon.icon,
          color: selectedColor,
          size: selectedSize,
        ),
        hideText
            ? Text(item.label.data!, style: TextStyle(color: selectedColor))
            : Container(),
      ],
    );
  }
}

class CustomBottomNavigationBarItems {
  const CustomBottomNavigationBarItems({
    Key? key,
    required this.label,
    required this.icon,
  });

  final Text label;
  final Icon icon;
}
