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
  Category selectedCategory;
  bool isSubmit = false;

  @override
  void initState() { 
    super.initState();

    Future.delayed(Duration.zero, () {
      final Target argument = ModalRoute.of(context).settings.arguments;

      targetNameController.text = argument.targetName;
      nominalController.text = argument.nominal.toString();
      periodController.text = argument.period.toString();
      descriptionController.text = argument.description;
      selectedCategory = argument.category;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ValidationProvider>(context, listen: false).changeAllTrue();
    final Target argument = ModalRoute.of(context).settings.arguments;

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
                                        },
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Edit Target",
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
                                      isEdit: true,
                                      labelName: "Jangka",
                                      hintText: argument.durationType,
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
                                isEdit: true,
                                labelName: "Tingkat Prioritas",
                                hintText: argument.priorityLevel,
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
                              if (isSubmit) SpinKitFadingCircle(
                                color: baseColor,
                                size: 46,
                              )
                              else CustomRaisedButton(
                                "Edit Target",
                                color: (validation.isAllEditTargetValidate()) ? baseColor : Color(0xFFCDCBCB),
                                textColor: lightColor,
                                onPressed: (validation.isAllEditTargetValidate()) ? () async {
                                  setState(() {
                                    isSubmit = true;
                                  });

                                  Target target = Target(
                                    targetName: targetNameController.text,
                                    nominal: int.parse(nominalController.text),
                                    period: int.parse(periodController.text),
                                    durationType: selectedDurationType == null ? argument.durationType : selectedDurationType,
                                    currentMoney: argument.currentMoney,
                                    category: selectedCategory,
                                    priorityLevel: selectedPriorityLevel == null ? argument.priorityLevel : selectedPriorityLevel,
                                    description: descriptionController.text == "" ? "-" : descriptionController.text,
                                    createdAt: argument.createdAt,
                                  );

                                  Target.updateTarget(argument.id, target);
                                  Provider.of<NavigationProvider>(context, listen: false).changeIndex(0);
                                  Provider.of<ValidationProvider>(context, listen: false).resetTargetChange();

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    MainScreen.routeName,
                                    (Route<dynamic> route) => false,
                                  );
                                } : null,
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
    );
  }
}
