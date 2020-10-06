part of 'screens.dart';

class EditTargetScreen extends StatefulWidget {
  static String routeName = '/edit_target_name';

  @override
  _EditTargetScreenState createState() => _EditTargetScreenState();
}

class _EditTargetScreenState extends State<EditTargetScreen> {
  TextEditingController targetNameController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String selectedPriorityLevel;
  String selectedDurationType;

  @override
  Widget build(BuildContext context) {
    final Category argument = ModalRoute.of(context).settings.arguments;

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
                                      "Edit Target - ${argument.name}",
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
                            CustomTextField(
                              labelText: "Nama Target",
                              hintText: "Masukan Nama Target",
                              keyboardType: TextInputType.text,
                              controller: targetNameController,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextField(
                              labelText: "Nominal",
                              hintText: "Masukan Nominal",
                              keyboardType: TextInputType.number,
                              controller: nominalController,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: CustomTextField(
                                    labelText: "Waktu",
                                    hintText: "Masukan Waktu",
                                    keyboardType: TextInputType.number,
                                    controller: periodController,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: CustomDropdownField(
                                    labelName: "Jangka",
                                    hintText: "Pilih Jangka",
                                    options: [
                                      "Hari",
                                      "Pekan",
                                      "Bulan",
                                      "Tahun",
                                    ],
                                    onChanged: (text) {
                                      setState(() {
                                        selectedDurationType = text;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomDropdownField(
                              labelName: "Tingkat Prioritas",
                              hintText: "Pilih Tingkat Prioritas",
                              options: [
                                "Rendah",
                                "Sedang",
                                "Tinggi",
                              ],
                              onChanged: (text) {
                                setState(() {
                                  selectedPriorityLevel = text;
                                });
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextField(
                              labelText: "Deskripsi",
                              hintText: "Masukan Deskripsi",
                              keyboardType: TextInputType.text,
                              controller: descriptionController,
                              maxLines: 5,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            CustomRaisedButton(
                              "Buat Target",
                              color: baseColor,
                              textColor: lightColor,
                              onPressed: () {
                                Provider.of<NavigationProvider>(context, listen: false).changeIndex(0);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainScreen.routeName,
                                      (Route<dynamic> route) => false,
                                );
                              },
                            ),
                            SizedBox(
                              height: 32,
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
