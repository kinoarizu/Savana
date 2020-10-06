part of 'utils.dart';

Map<String, WidgetBuilder> appRoute = {
  MainScreen.routeName: (context) => MainScreen(),
  SummaryScreen.routeName: (context) => SummaryScreen(),
  DetailTargetScreen.routeName: (context) => DetailTargetScreen(),
  TargetCategoryScreen.routeName: (context) => TargetCategoryScreen(),
  CreateTargetScreen.routeName: (context) => CreateTargetScreen(),
  CreateSavingScreen.routeName: (context) => CreateSavingScreen(),
  EditTargetScreen.routeName: (context) => EditTargetScreen(),
};