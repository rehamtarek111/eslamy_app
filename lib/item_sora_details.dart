import 'package:flutter/material.dart';
// import 'package:eslamyyy/sora_details_screen.dart';

class ItemSoraDetails extends StatelessWidget {
  String name;
  int index;

  ItemSoraDetails({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name{${index + 1}}',
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
