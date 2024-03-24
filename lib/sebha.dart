import 'package:eslamyy/my_theme.dart';
import 'package:eslamyy/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> Azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر"
  ];
  int index = 0;
  double angle = 0;
  int counter = 0;

  // void changeRotation() {
  //   setState(() => turns += 0.1 / 6);
  //}

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Transform.rotate(
            angle: angle,
            child: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  counter++;
                  if (counter % 33 == 0) {
                    index++;
                    counter = 0;
                  }
                  if (index == Azkar.length) {
                    index = 0;
                  }
                  angle += 0.1 / 6;
                  setState(() {});
                },
                child: Image.asset('assets/images/sebha.png')),
          ),
          SizedBox(
            height: 25,
          ),
          Text("عدد التسبيحات",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text("$counter",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text("${Azkar[index]} ",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed:()=>changeRotation(),
//           //    OnPressed:()=>changeRotation();
//           child: Text(text,style: Theme.of(context).textTheme.titleMedium,),),
//         Container(color: MyTheme.primaryLight),
//
//   //    Container(counter ,child: Theme.of(context).textTheme.titleMedium,),
//         Padding(
//           padding: const EdgeInsets.all(15),
//           child: AnimatedRotation(
//             turns: turns,
//             duration: const Duration(milliseconds: 10),
//             child: Image.asset('assets/images/sebha.png'),
//           ),
//         ),
//       ],
//     );
//   }
// }
// String text="سبحان الله";
// int counter=0;
// double turns = 0.0;
//
// void changeRotation() {
//
//     turns += 0.1 / 6;
//     counter++;
//
//     if (counter >= 1 && counter <= 33) {
//       text = 'سبحان الله';
//       counter =0;
//     } else if (counter >= 34 && counter <= 66) {
//       text = 'الحمد لله';
//       counter =0;
//
//     } else if (counter >= 67 && counter <= 99) {
//       text = 'الله أكبر';
//       counter =0;

//}
// }
