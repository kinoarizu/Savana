part of 'screens.dart';

class CreateTargetScreen extends StatefulWidget {
  static String routeName = '/create_target_screen';

  @override
  _CreateTargetScreenState createState() => _CreateTargetScreenState();
}

class _CreateTargetScreenState extends State<CreateTargetScreen> {
  TextEditingController targetNameController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String selectedPriorityLevel;
  String selectedDurationType;

  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    final Category argument = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();
        return;
      },
      child: Scaffold(
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
                          child: Consumer<ValidationProvider>(
                            builder: (context, validation, _) => Column(
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
                                            Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Buat Target - ${argument.name}",
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
                                  errorValidation: validation.errorTargetName,
                                  onChanged: (value) {
                                    validation.changeTargetName(value);
                                  },
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomTextField(
                                  labelText: "Nominal",
                                  hintText: "Masukan Nominal",
                                  keyboardType: TextInputType.number,
                                  controller: nominalController,
                                  errorValidation: validation.errorNominal,
                                  onChanged: (value) {
                                    validation.changeNominal(value);
                                  },
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
                                        errorValidation: validation.errorPeriod,
                                        onChanged: (value) {
                                          validation.changePeriod(value);
                                        },
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
                                if(isSubmit) SpinKitFadingCircle(
                                  color: baseColor,
                                  size: 46,
                                )
                                else CustomRaisedButton(
                                  "Buat Target",
                                  color: (validation.isAllTargetValidate(selectedDurationType, selectedPriorityLevel)) ? baseColor : Color(0xFFCDCBCB),
                                  textColor: lightColor,
                                  onPressed: () async {
                                    setState(() {
                                      isSubmit = true;
                                    });

                                    Target target = Target(
                                      targetName: targetNameController.text,
                                      nominal: int.parse(nominalController.text),
                                      period: int.parse(periodController.text),
                                      durationType: selectedDurationType,
                                      currentMoney: 0,
                                      category: argument,
                                      priorityLevel: selectedPriorityLevel,
                                      description: descriptionController.text ?? "-",
                                      createdAt: DateTime.now().millisecondsSinceEpoch,
                                    );

                                    Target.storeTarget(target);
                                    Provider.of<NavigationProvider>(context, listen: false).changeIndex(0);
                                    Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();

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
    );
  }
}
