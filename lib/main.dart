import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:savana/common/theme/theme.dart';
import 'package:savana/common/utils/utils.dart';
import 'package:savana/provider/provider.dart';
import 'package:savana/ui/screens/screens.dart';
import 'package:savana/models/history.dart';
import 'package:savana/models/target.dart';
import 'package:savana/models/category.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter<History>(HistoryAdapter());
  Hive.registerAdapter<Target>(TargetAdapter());
  Hive.registerAdapter<Category>(CategoryAdapter());

  await Hive.openBox<History>("histories");
  await Hive.openBox<Target>("targets");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ValidationProvider()),
      ],
      child: MaterialApp(
        title: "Savana - Tabungan Mobile",
        theme: ThemeData(primaryColor: baseColor),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: appRoute,
      ),
    );
  }
}
