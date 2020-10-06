part of 'screens.dart';

class CreateSavingScreen extends StatefulWidget {
  static String routeName = '/create_saving_screen';

  @override
  _CreateSavingScreenState createState() => _CreateSavingScreenState();
}

class _CreateSavingScreenState extends State<CreateSavingScreen> {
  TextEditingController nominalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String selectedTarget;
  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    List<String> options = [];
    Box<Target> targetBox = Hive.box<Target>('targets');

    for (var i = 0; i < targetBox.values.length; i++) {
      Target target = targetBox.getAt(i);
      options.add(target.targetName);
    }

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
                                            Navigator.pop(context);
                                            Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();
                                          },
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Tambah Tabungan",
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
                                CustomDropdownField(
                                  labelName: "Nama Target",
                                  hintText: "Pilih Target",
                                  options: options,
                                  onChanged: (text) {
                                    setState(() {
                                      selectedTarget = text;
                                    });
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
                                CustomTextField(
                                  labelText: "Deskripsi",
                                  hintText: "Masukan Deskripsi",
                                  keyboardType: TextInputType.text,
                                  controller: descriptionController,
                                  maxLines: 5,
                                ),
                                SizedBox(
                                  height: 116,
                                ),
                                if (isSubmit) SpinKitFadingCircle(
                                  color: baseColor,
                                  size: 46,
                                )
                                else CustomRaisedButton(
                                  "Masukan Tabungan",
                                  color: (validation.isAllHistoryValidate(selectedTarget)) ? baseColor : Color(0xFFCDCBCB),
                                  textColor: lightColor,
                                  onPressed: () async {
                                    setState(() {
                                      isSubmit = true;
                                    });

                                    History history = History(
                                      targetName: selectedTarget,
                                      nominal: int.parse(nominalController.text),
                                      description: descriptionController.text ?? "-",
                                      createdAt: DateTime.now().millisecondsSinceEpoch,
                                    );

                                    History.storeHistory(history);
                                    Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();
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
