import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/constants.dart';

import 'storage_icon.dart';

class StorageButton extends StatelessWidget {
  const StorageButton({
    super.key,
    required this.name,
    this.sysname,
    this.format,
    required this.size,
    this.onPressed,
  });

  final String name;
  final String? sysname;
  final String? format;
  final int size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StorageIcon(name: name),
          const SizedBox(height: kContentSpacing / 2),
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
          const SizedBox(height: kContentSpacing / 2),
          Text(
            sysname != null && format != null
                ? '$sysname ($format)'
                : sysname ?? format ?? '',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: kContentSpacing / 2),
          Text(
            filesize(size),
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
