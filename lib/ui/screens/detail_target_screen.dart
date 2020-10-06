part of 'screens.dart';

class DetailTargetScreen extends StatelessWidget {
  static String routeName = '/detail_target_screen';

  @override
  Widget build(BuildContext context) {
    final Target argument = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: baseColor,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: deviceWidth(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          color: lightColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32),
                            topLeft: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius: 100,
                                  lineWidth: 11,
                                  animation: true,
                                  progressColor: baseColor,
                                  animateFromLastPercent: true,
                                  animationDuration: 2000,
                                  percent: getPercentDouble(
                                    argument.currentMoney,
                                    argument.nominal,
                                  ),
                                  center: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        getPercent(
                                          argument.currentMoney,
                                          argument.nominal
                                        ),
                                        style: extraBoldBaseFont.copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        "%",
                                        style: extraBoldBaseFont.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: (getOrientation(context) == Orientation.portrait) ? 20 : 60,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Progress telah mencapai ${getPercent(argument.currentMoney, argument.nominal)}%\ndari total target",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: EdgeInsets.all(7),
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(argument.category.color),
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            argument.category.icon,
                                          ),
                                        ),
                                        Text(
                                          argument.category.name,
                                          style: semiBoldBaseFont.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Divider(
                              color: Color(0xFFCCCCCC),
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tabungan Terkumpul",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: "Rp ",
                                      ).format(argument.currentMoney),
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sisa Target",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: "Rp ",
                                      ).format(
                                        argument.nominal - argument.currentMoney,
                                      ),
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Jangka Waktu",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "0.3 Bulan / 1 Bulan",
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tabungan Perbulan",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: "Rp ",
                                      ).format(36000000),
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tabungan Perhari",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        decimalDigits: 0,
                                        symbol: "Rp ",
                                      ).format(120000),
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Deskripsi",
                                      style: boldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Semoga cepat tercapai",
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    FlatButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/ic_edit.svg",
                                            width: 12,
                                            height: 12,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Edit",
                                            style: extraBoldBaseFont.copyWith(
                                              fontSize: 14,
                                              color: greenColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, EditTargetScreen.routeName,
                                          arguments: argument.category,
                                        );
                                      },
                                    ),
                                    FlatButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/svg/ic_delete.svg",
                                            width: 12,
                                            height: 12,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Hapus",
                                            style: extraBoldBaseFont.copyWith(
                                              fontSize: 14,
                                              color: Color(0xFFFF2929),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        deleteTargetModal(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(
                              color: Color(0xFFCCCCCC),
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Riwayat Tabungan",
                              style: boldBaseFont.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: (histories.length * 86 - 16).toDouble(),
                              child: (histories.length > 0) ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: histories.length,
                                itemBuilder: (_, index) => Padding(
                                  padding: EdgeInsets.only(
                                    top: (index == 0) ? 0 : 16,
                                  ),
                                  child: SavingHistoryCard(
                                    targetName: histories[index].targetName,
                                    nominal: histories[index].nominal,
                                  ),
                                ),
                              ) : Center (
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
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                top: 24,
                                left: 4,
                              ),
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
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              argument.targetName,
                              style: extraBoldBaseFont.copyWith(
                                fontSize: 26,
                                color: lightColor,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: "Rp ",
                              ).format(argument.nominal),
                              style: boldBaseFont.copyWith(
                                fontSize: 18,
                                color: lightColor,
                              ),
                            ),
                            SizedBox(
                              height: 38,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteTargetModal(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Apakah kamu yakin ingin menghapus target ini?",
            style: semiBoldBaseFont.copyWith(
              fontSize: 16,
            ),
          ),
          actions: [
            FlatButton(
              child: Text(
                "Iya",
                style: extraBoldBaseFont,
              ),
              onPressed: () {
                Provider.of<NavigationProvider>(context, listen: false).changeIndex(0);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainScreen.routeName,
                  (Route<dynamic> route) => false,
                );
              },
            ),
            FlatButton(
              child: Text(
                "Tidak",
                style: extraBoldBaseFont,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }
}
