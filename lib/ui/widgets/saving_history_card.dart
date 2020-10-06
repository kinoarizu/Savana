part of 'widgets.dart';

class SavingHistoryCard extends StatelessWidget {
  final String targetName;
  final int nominal;

  SavingHistoryCard({
    this.targetName,
    this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultWidth(context),
      height: 70,
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
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
              color: greenColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "assets/svg/ic_money.svg",
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
              Text(
                "Uang Masuk",
                style: boldBaseFont.copyWith(
                  fontSize: 11,
                  color: greyColor,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            "+"+NumberFormat.currency(
              locale: 'id_ID',
              decimalDigits: 0,
              symbol: "Rp ",
            ).format(nominal),
            style: extraBoldBaseFont.copyWith(
              fontSize: 14,
              color: greenColor,
            ),
          ),
        ],
      ),
    );
  }
}
