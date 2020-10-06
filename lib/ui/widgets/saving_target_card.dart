part of 'widgets.dart';

class SavingTargetCard extends StatelessWidget {
  final String targetName;
  final int nominal;
  final int currentMoney;
  final String durationType;
  final int period;
  final String icon;
  final Color color;
  final Function onTap;
  final Category category;

  SavingTargetCard({
    this.targetName,
    this.nominal,
    this.currentMoney,
    this.durationType,
    this.period,
    this.icon,
    this.color,
    this.onTap,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    String nominalString = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: "Rp ",
    ).format(
      getNominalPerDay(
        nominal,
        period,
        durationType,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 20,
            offset: Offset(0, 6),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: defaultWidth(context),
            height: 70,
            padding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Color(category.color),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    category.icon,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      targetName,
                      style: extraBoldBaseFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          (currentMoney == nominal) ? "Completed" : "On Progress",
                          style: boldBaseFont.copyWith(
                            fontSize: 11,
                            color: (currentMoney == nominal) ? greenColor : yellowColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$period $durationType",
                          style: boldBaseFont.copyWith(
                            fontSize: 11,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: "Rp ",
                      ).format(nominal),
                      style: extraBoldBaseFont.copyWith(
                        fontSize: 14,
                        color: greenColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      generateZeroDigit(nominalString),
                      style: boldBaseFont.copyWith(
                        fontSize: 11,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
