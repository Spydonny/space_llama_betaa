import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform ;

class DefaultSwitch extends StatelessWidget {
  const DefaultSwitch({super.key,
    required this.value,
    required this.icon1,
    required this.icon2,
    this.onChanged
  });
  final bool value;
  final Icon icon1;
  final Icon icon2;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TargetPlatform.iOS == defaultTargetPlatform ?
    CupertinoSwitch(
        value: value,
        onChanged: onChanged
    ) :
    Switch(
        thumbIcon: WidgetStateProperty.all<Icon>(value ? icon1 : icon2),
        value: value,
        onChanged: onChanged
    )
    ;
  }
}
