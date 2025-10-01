import 'package:flutter/material.dart';

class PlatesCardWidget extends StatelessWidget {
  const PlatesCardWidget({super.key, this.title, required this.child});

  final Widget? title;
  final Widget? child;

  Widget _renderTitle(context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: DefaultTextStyle(
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
        child: Row(children: [Expanded(child: title!)]),
      ),
    );
  }

  Widget _renderChild(context) {
    return Padding(
      padding: EdgeInsets.only(top: title != null ? 8 : 16, bottom: 8),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) _renderTitle(context),
          if (title != null)
            Divider(
              height: 1,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          if (child != null) _renderChild(context),
        ],
      ),
    );
  }
}
