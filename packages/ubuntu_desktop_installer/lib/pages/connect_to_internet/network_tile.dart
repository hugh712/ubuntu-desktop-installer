import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class NetworkTile extends StatelessWidget {
  const NetworkTile(
      {super.key, this.leading, this.title, this.subtitle, this.trailing});

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final size =
        kCheckradioActivableAreaPadding.inflateSize(kCheckradioTogglableSize);
    return Row(
      children: [
        SizedBox.fromSize(
          size: size,
          child: Center(child: leading),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle1!,
                  child: title!,
                ),
              if (title != null && subtitle != null) const SizedBox(height: 2),
              if (subtitle != null)
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyText2!,
                  child: subtitle!,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox.fromSize(
          size: size,
          child: Center(child: trailing),
        ),
      ],
    );
  }
}
