import 'package:flutter/material.dart';

import '../default_switch.dart';

class SwitchContainer extends StatelessWidget {
  const SwitchContainer({super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.value,
    this.onChanged
  });

  final double height;
  final double width;
  final bool value;
  final String title;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const borderRadius = 25.0;
    const sunIcon = Icon(Icons.sunny);
    const moonIcon = Icon(Icons.nights_stay_sharp,
      color: Colors.white,
    );

    return Center(
        child: Container(
          width: width*0.85,
          height: height*0.08,
          padding: const EdgeInsets.only(right: 35, left: 35),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: theme.colorScheme.onPrimaryContainer
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: theme.textTheme.headlineMedium),
              DefaultSwitch(value: value, icon1: moonIcon, icon2: sunIcon, onChanged: onChanged,)
            ],
          ),
        )
    );
  }
}


