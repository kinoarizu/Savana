part of 'screens.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 140 - statusBarHeight(context),
              bottom: 104,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    if(navigationProvider.isTargetTab) Container(
                      height: (Hive.box<Target>('targets').values.length * 86).toDouble(),
                      child: ValueListenableBuilder(
                        valueListenable: Hive.box<Target>('targets').listenable(),
                        builder: (context, Box<Target> box, _) {
                          if (box.values.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/no_data_illustration.svg",
                                    width: 180,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                  "Kamu Belum Ada\nTarget Tabungan",
                                  textAlign: TextAlign.center,
                                    style: semiBoldBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: box.values.length,
                            itemBuilder: (_, index) {
                              Target targets = box.getAt(index);

                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 16,
                                ),
                                child: SavingTargetCard(
                                  targetName: targets.targetName,
                                  nominal: targets.nominal,
                                  period: targets.period,
                                  durationType: targets.durationType,
                                  currentMoney: targets.currentMoney,
                                  category: targets.category,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context, DetailTargetScreen.routeName,
                                      arguments: Target(
                                        id: index,
                                        targetName: targets.targetName,
                                        nominal: targets.nominal,
                                        period: targets.period,
                                        durationType: targets.durationType,
                                        currentMoney: targets.currentMoney,
                                        category: targets.category,
                                        priorityLevel: targets.priorityLevel,
                                        description: targets.description,
                                        createdAt: targets.createdAt,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
                      ),
                    ) else Container(
                      height: (Hive.box<History>('histories').values.length * 86).toDouble(),
                      child: ValueListenableBuilder(
                        valueListenable: Hive.box<History>('histories').listenable(),
                        builder: (context, Box<History> box, _) {
                          if (box.values.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/no_data_illustration.svg",
                                    width: 180,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                  "Kamu Belum Ada\nRiwayat Tabungan",
                                  textAlign: TextAlign.center,
                                    style: semiBoldBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: box.values.length,
                            itemBuilder: (_, index) {
                              History histories = box.getAt(index);

                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 16,
                                ),
                                child: SavingHistoryCard(
                                  targetName: histories.targetName,
                                  nominal: histories.nominal,
                                ),
                              );
                            },
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: deviceWidth(context),
          height: 140 - statusBarHeight(context),
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Savana - Aplikasi Tabungan Mobile",
                style: semiBoldBaseFont.copyWith(
                  fontSize: 16,
                  color: lightColor,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      navigationProvider.changeIndex(1, isTargetTab: true);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/ic_new_target.svg",
                              width: 16,
                              height: 16,
                              color: (navigationProvider.isTargetTab) ? lightColor : greyColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Target Nabung",
                              style: semiBoldBaseFont.copyWith(
                                color: (navigationProvider.isTargetTab) ? lightColor : greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 4,
                          width: deviceWidth(context) / 2 - 20,
                          color: (navigationProvider.isTargetTab) ? Color(0xFFDDDDDD) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      navigationProvider.changeIndex(1, isTargetTab: false);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/ic_add_saving.svg",
                              width: 16,
                              height: 16,
                              color: !(navigationProvider.isTargetTab) ? lightColor : greyColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Daftar Tabungan",
                              style: semiBoldBaseFont.copyWith(
                                color: !(navigationProvider.isTargetTab) ? lightColor : greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 4,
                          width: deviceWidth(context) / 2 - 20,
                          color: !(navigationProvider.isTargetTab) ? Color(0xFFDDDDDD) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
