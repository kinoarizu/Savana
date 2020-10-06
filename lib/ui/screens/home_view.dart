part of 'screens.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: deviceWidth(context),
            height: 140 - statusBarHeight(context),
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
                  height: 16,
                ),
                Container(
                  width: defaultWidth(context),
                  height: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF888888).withOpacity(0.25),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: Hive.box<History>('histories').listenable(),
                        builder: (context, Box<History> box, _) {
                          int currentMoney = box.values.fold(0, (sum, historyBox) => sum + historyBox.nominal);
                          int todayMoney = box.values.where((targetBox) {
                            int historyDate = DateTime.fromMillisecondsSinceEpoch(targetBox.createdAt).day;
                            int currentDate = DateTime.now().day;
                            return historyDate == currentDate;
                          }).fold(0, (sum, histories) => sum + histories.nominal);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Uangku",
                                style: semiBoldBaseFont.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: "Rp ",
                                ).format(currentMoney),
                                style: extraBoldBaseFont.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: "+Rp ",
                                ).format(todayMoney) + " Hari Ini",
                                style: semiBoldBaseFont.copyWith(
                                  fontSize: 12,
                                  color: greenColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          heroTag: "btn_summary",
                          backgroundColor: baseColor,
                          child: SvgPicture.asset(
                            "assets/svg/ic_chart.svg",
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, SummaryScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Target Menabung",
                      style: semiBoldBaseFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: Text(
                        "Lihat Semua",
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Provider.of<NavigationProvider>(context, listen: false).changeIndex(1);
                      },
                    ),
                  ],
                ),
                Container(
                  height: (3 * 86 - 16).toDouble(),
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
                        itemCount: box.values.take(3).length,
                        itemBuilder: (_, index) {
                          Target targets = box.getAt(index);

                          return Padding(
                            padding: EdgeInsets.only(
                              top: (index == 0) ? 0 : 16,
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
                                    targetName: targets.targetName,
                                    nominal: targets.nominal,
                                    period: targets.period,
                                    durationType: targets.durationType,
                                    currentMoney: targets.currentMoney,
                                    category: targets.category,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Riwayat Tabungan",
                      style: semiBoldBaseFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: Text(
                        "Lihat Semua",
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Provider.of<NavigationProvider>(context, listen: false).changeIndex(1, isTargetTab: false);
                      },
                    ),
                  ],
                ),
                Container(
                  height: (3 * 86 - 16).toDouble(),
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
                        itemCount: box.values.take(3).length,
                        itemBuilder: (_, index) {
                          History histories = box.getAt(index);

                          return Padding(
                            padding: EdgeInsets.only(
                              top: (index == 0) ? 0 : 16,
                            ),
                            child: SavingHistoryCard(
                              targetName: histories.targetName,
                              nominal: histories.nominal,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 104,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
