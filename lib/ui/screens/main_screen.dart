part of 'screens.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: baseColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: screenColor,
                ),
                PageView(
                  controller: navigationProvider.pageIndex,
                  onPageChanged: (index) {
                    navigationProvider.changeIndex(index);
                  },
                  children: [
                    HomeView(),
                    HistoryView(),
                  ],
                ),
                customBottomNavigationBar(context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(
                      bottom: 36,
                    ),
                    child: FloatingActionButton(
                      heroTag: "btn_navbar",
                      backgroundColor: baseColor,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 3,
                        ),
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          "assets/svg/ic_tabung_add.svg",
                        ),
                      ),
                      onPressed: () {
                        savingBottomSheetModal(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void savingBottomSheetModal(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          width: deviceWidth(context),
          height: 150,
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            children: [
              Container(
                width: 135,
                height: 4.5,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: baseColor,
                          child: SvgPicture.asset(
                            "assets/svg/ic_new_target.svg",
                            width: 26,
                            height: 26,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, TargetCategoryScreen.routeName);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Buat Target Baru",
                        style: boldBaseFont.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: baseColor,
                          child: SvgPicture.asset(
                            "assets/svg/ic_add_saving.svg",
                            width: 26,
                            height: 26,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, CreateSavingScreen.routeName);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tambah Tabungan",
                        style: boldBaseFont.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customBottomNavigationBar(BuildContext context) {
    NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: ShadowClipPainter(
          clipper: BottomNavBarClipper(),
          shadow: BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 20,
            offset: Offset(6, 0),
            spreadRadius: -5,
          ),
        ),
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: navigationProvider.index,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              onTap: (index) {
                navigationProvider.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  title: Text(
                    "Beranda",
                    style: boldBaseFont.copyWith(
                      fontSize: 11,
                      color: (navigationProvider.index == 0) ? baseColor : greyColor,
                    ),
                  ),
                  icon: Container(
                    margin: EdgeInsets.only(
                      bottom: 4,
                    ),
                    height: 28,
                    child: SvgPicture.asset(
                      (navigationProvider.index == 0) ? "assets/svg/ic_home.svg" : "assets/svg/ic_home_grey.svg",
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Riwayat",
                    style: boldBaseFont.copyWith(
                      fontSize: 11,
                      color: (navigationProvider.index == 1) ? baseColor : greyColor,
                    ),
                  ),
                  icon: Container(
                    margin: EdgeInsets.only(
                      bottom: 4,
                    ),
                    height: 28,
                    child: SvgPicture.asset(
                      (navigationProvider.index == 1) ? "assets/svg/ic_list.svg" : "assets/svg/ic_list_grey.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 32, 0);
    path.quadraticBezierTo(size.width / 2 - 32, 40, size.width / 2, 40);
    path.quadraticBezierTo(size.width / 2 + 32, 40, size.width / 2 + 32, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShadowClipPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ShadowClipPainter({
    @required this.shadow,
    @required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);

    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
