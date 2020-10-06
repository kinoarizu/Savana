part of 'theme.dart';

const double defaultMargin = 20;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double defaultWidth(BuildContext context) => deviceWidth(context) - 2 * defaultMargin;
double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;
Orientation getOrientation(BuildContext context) => MediaQuery.of(context).orientation;