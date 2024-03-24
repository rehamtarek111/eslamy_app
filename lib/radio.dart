import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            'assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'),
        SizedBox(
          height: 10,
        ),
        Text('إذاعة القران الكريم',
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(
          height: 10,
        ),
        Image.asset('assets/images/radio_icon.png', height: 30),
      ],
    );
  }
}
