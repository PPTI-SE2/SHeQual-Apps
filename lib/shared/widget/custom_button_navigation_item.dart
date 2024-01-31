import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/page_providers.dart';
import '../../shared/theme.dart';

class CustomButtonNavigationItem extends StatefulWidget {
  final int index;
  final String imageUrl;

  const CustomButtonNavigationItem({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key); 

  @override
  State<CustomButtonNavigationItem> createState() => _CustomButtonNavigationItemState();
}

class _CustomButtonNavigationItemState extends State<CustomButtonNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageProviders>(
      builder: (BuildContext context, pageProvider, _) {
        return GestureDetector(
          onTap: () {
            setState(() {
              pageProvider.setIndex(widget.index);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                widget.imageUrl,
                width: 24,
                height: 24,
                color: (pageProvider.getIndex() == widget.index)
                    ? kPrimaryColor
                    : kGreyColor,
              ),
              Container(
                width: 30,
                height: 2,
                color: (pageProvider.getIndex() == widget.index)
                    ? kPrimaryColor
                    : kTransparent,
              ),
            ],
          ),
        );
      },
    );
  }
}
