part of 'provider.dart';

class NavigationProvider extends ChangeNotifier{
  int _index = 0;
  PageController _pageIndex = PageController(initialPage: 0);
  bool _isTargetTab = true;

  int get index => _index;
  PageController get pageIndex => _pageIndex;
  bool get isTargetTab => _isTargetTab;

  void changeIndex(int index, {bool isTargetTab = true}) {
    _index = index;
    _pageIndex.jumpToPage(index);
    _isTargetTab = isTargetTab;

    notifyListeners();
  }
}