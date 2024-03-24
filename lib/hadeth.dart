import 'dart:core';
import 'package:eslamyy/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'hadeth_name.dart';
import 'my_theme.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (ahadethList.isEmpty) {
      loadFiles();
    }
    return Column(
      children: [
        Center(
          child: Image.asset("assets/images/hadeth_logo.png"),
        ),
        Divider(
          color:
              provider.isDarkMode() ? MyTheme.primaryDark : MyTheme.whiteColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color:
              provider.isDarkMode() ? MyTheme.primaryDark : MyTheme.whiteColor,
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: MyTheme.primaryLight,
              ))
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyTheme.primaryDark
                          : MyTheme.whiteColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                      hadeth: ahadethList[index],
                    );
                  },
                  itemCount: ahadethList.length,
                ),
              )
      ],
    );
  }

  void loadFiles() async {
    String hadethContent =
        await rootBundle.loadString('assets/images/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);

      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
