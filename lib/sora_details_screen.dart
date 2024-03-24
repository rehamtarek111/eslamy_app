import 'package:eslamyy/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'item_sora_details.dart';
import 'my_theme.dart';

class SoraDetailsScreen extends StatefulWidget {
  static const String routeName = "sora_details_screen";

  SoraDetailsScreen({super.key});

  @override
  State<SoraDetailsScreen> createState() => _SoraDetailsScreenState();
}

class _SoraDetailsScreenState extends State<SoraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SoraDetailsArgs;
    //بستقبل الداتا الي هي الصور القرانيه
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('${args.name}',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: MyTheme.primaryLight,
              ))
            : Container(
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
                    return ItemSoraDetails(name: verses[index], index: index);
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SoraDetailsArgs {
  String name;
  int index;

  SoraDetailsArgs({required this.name, required this.index});
}
