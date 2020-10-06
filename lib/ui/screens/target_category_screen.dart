part of 'screens.dart';

class TargetCategoryScreen extends StatelessWidget {
  static String routeName = '/target_category_screen';

  @override
  Widget build(BuildContext context) {
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
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: deviceWidth(context),
                        height: 105 - statusBarHeight(context),
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              margin: EdgeInsets.only(
                                top: 16,
                                bottom: 6,
                                left: 8,
                                right: 8,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      child: SvgPicture.asset(
                                        "assets/svg/arrow_back.svg",
                                        width: 20,
                                        height: 20,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Pilih Kategori",
                                      textAlign: TextAlign.center,
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 16,
                                        color: lightColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Wrap(
                              spacing: 28,
                              runSpacing: 18,
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                TargetCategoryCard(
                                  category: Category.electronic,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.electronic,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.building,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.building,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.vehicle,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.vehicle,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.clothes,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.clothes,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.travel,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.travel,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.education,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.education,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.food,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.food,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.health,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.health,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.game,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.game,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.pet,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.pet,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.gift,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.gift,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.care,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.care,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.sport,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.sport,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.entertainment,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.entertainment,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.accessories,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.accessories,
                                    );
                                  },
                                ),
                                TargetCategoryCard(
                                  category: Category.other,
                                  onPressed: () {
                                    Navigator.pushNamed(context, CreateTargetScreen.routeName,
                                      arguments: Category.other,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
