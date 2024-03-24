import 'package:eslamyy/sora_details_screen.dart';
import 'package:flutter/material.dart';

class ItemSoraName extends StatelessWidget {
  String name;
  int index;

  ItemSoraName({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SoraDetailsScreen.routeName,
            arguments: SoraDetailsArgs(name: name, index: index));
      },
      child: Text(
        textAlign: TextAlign.center,
        name,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
