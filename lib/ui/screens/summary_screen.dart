part of 'screens.dart';

class SummaryScreen extends StatefulWidget {
  static String routeName = '/summary_screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final Color leftBarColor = const Color(0xFFF5576C);
  final double width = 27;

  bool showAvg = false;
  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  List<Color> gradientColors = [
    const Color(0xFF23B6E6),
    const Color(0xFF02D39A),
  ];

  @override
  void initState() {
    super.initState();

    final barGroup1 = makeGroupData(0, 5000);
    final barGroup2 = makeGroupData(1, 16000);
    final barGroup3 = makeGroupData(2, 18000);
    final barGroup4 = makeGroupData(3, 20000);
    final barGroup5 = makeGroupData(4, 17000);
    final barGroup6 = makeGroupData(5, 19000);
    final barGroup7 = makeGroupData(6, 10000);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Rekapitulasi Tabungan",
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
                              height: 20,
                            ),
                            Text(
                              "Rekap Mingguan",
                              style: boldBaseFont.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: defaultWidth(context),
                              height: 225,
                              padding: EdgeInsets.only(
                                left: 12,
                                right: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        maxY: 30,
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            textStyle: regularBaseFont.copyWith(
                                              color: Color(0xFF8D9AA9),
                                              fontSize: 12,
                                            ),
                                            interval: 5,
                                            getTitles: (double value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return 'Min';
                                                case 1:
                                                  return 'Sen';
                                                case 2:
                                                  return 'Sel';
                                                case 3:
                                                  return 'Rab';
                                                case 4:
                                                  return 'Kam';
                                                case 5:
                                                  return 'Jum';
                                                case 6:
                                                  return 'Sab';
                                                default:
                                                  return '';
                                              }
                                            },
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: true,
                                            margin: 20,
                                            textStyle: regularBaseFont.copyWith(
                                              color: Color(0xFF8D9AA9),
                                              fontSize: 12,
                                            ),
                                            interval: 4,
                                            reservedSize: 10,
                                            getTitles: (value) {
                                              return value.toInt().toString() + "K";
                                            },
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          checkToShowHorizontalLine: (value) => value % 4 == 0,
                                          getDrawingHorizontalLine: (value) => FlLine(
                                            color: const Color(0xFFDDDDDD),
                                            strokeWidth: 1,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        barGroups: showingBarGroups,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Rekap Bulanan",
                              style: boldBaseFont.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: defaultWidth(context),
                              height: 230,
                              padding: EdgeInsets.only(
                                right: 6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: LineChart(
                                      LineChartData(
                                        gridData: FlGridData(
                                          show: true,
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: const Color(0xFFEEEEEE),
                                              strokeWidth: 1,
                                            );
                                          },
                                        ),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            textStyle: regularBaseFont.copyWith(
                                              color: Color(0xFF8D9AA9),
                                              fontSize: 12,
                                            ),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 1:
                                                  return 'Jan';
                                                case 2:
                                                  return 'Feb';
                                                case 3:
                                                  return 'Mar';
                                                case 4:
                                                  return 'Apr';
                                                case 5:
                                                  return 'Mei';
                                                case 6:
                                                  return 'Jun';
                                                case 7:
                                                  return 'Jul';
                                                case 8:
                                                  return 'Agu';
                                                case 9:
                                                  return 'Sep';
                                                case 10:
                                                  return 'Okt';
                                              }
                                              return '';
                                            },
                                            margin: 8,
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: true,
                                            textStyle: regularBaseFont.copyWith(
                                              color: Color(0xFF8D9AA9),
                                              fontSize: 12,
                                            ),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 1:
                                                  return '10k';
                                                case 2:
                                                  return '30k';
                                                case 3:
                                                  return '50k';
                                                case 4:
                                                  return '60k';
                                                case 5:
                                                  return '70k';
                                                case 6:
                                                  return '80k';
                                                case 7:
                                                  return '90k';
                                              }
                                              return '';
                                            },
                                            margin: 12,
                                          ),
                                        ),
                                        minX: 0,
                                        maxX: 11,
                                        minY: 0,
                                        maxY: 8,
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: [
                                              FlSpot(0, 3),
                                              FlSpot(2.6, 2),
                                              FlSpot(4.9, 5),
                                              FlSpot(6.8, 3.1),
                                              FlSpot(8, 4),
                                              FlSpot(9.5, 3),
                                              FlSpot(11, 4),
                                            ],
                                            isCurved: true,
                                            colors: gradientColors,
                                            barWidth: 5,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(
                                              show: false,
                                            ),
                                            belowBarData: BarAreaData(
                                              show: true,
                                              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
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

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1 / 1000,
          color: leftBarColor,
          width: width,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }
}
