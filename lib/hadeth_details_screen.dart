import 'package:eslamyy/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'hadeth.dart';
import 'item_hadeth_details.dart';
import 'item_sora_details.dart';
import 'my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "hadeth_details_screen";

  // HadethDetailsScreen({super.key, required String name, required int index});
  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset('assets/images/bgDark.png',
              width: double.infinity, height: double.infinity, fit: BoxFit.fill)
          : Image.asset(
              'assets/images/bg3.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text('${args.title}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.06,
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ),
          decoration: BoxDecoration(
            color: provider.isDarkMode()
                ? MyTheme.primaryDark
                : MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
