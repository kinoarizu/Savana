part of 'provider.dart';

class ValidationProvider extends ChangeNotifier {
  String _errorTargetName;
  String _errorNominal;
  String _errorPeriod;

  String get errorTargetName => _errorTargetName;
  String get errorNominal => _errorNominal;
  String get errorPeriod => _errorPeriod;

  void changeTargetName(String value) {
    if (value.length == 0) {
      _errorTargetName = "Nama Target Harus Diisikan";
    }
    else {
      _errorTargetName = "";
    }

    notifyListeners();
  }

  void changeNominal(String value) {
    if (int.parse(value) < 1000) {
      _errorNominal = "Nominal Minimal Rp. 1000";
    }
    else if (value.length == 0) {
      _errorNominal = "Nominal Harus Diisikan";
    }
    else {
      _errorNominal = "";
    }

    notifyListeners();
  }

  void changePeriod(String value) {
    if (int.parse(value) == 0) {
      _errorPeriod = "Tidak Boleh 0";
    }
    else if (value.length == 0) {
      _errorPeriod = "Harus Diisikan";
    }
    else {
      _errorPeriod = "";
    }

    notifyListeners();
  }

  bool isAllHistoryValidate(String targetName) {
    if (_errorNominal == "" && targetName != null) {
      return true;
    }
    else {
      return false;
    }
  }

  bool isAllTargetValidate(String durationType, String priorityLevel) {
    if (_errorTargetName == "" && _errorNominal == "" && _errorPeriod == "" && durationType != null && priorityLevel != null) {
      return true;
    }
    else {
      return false;
    }
  }

  void resetTargetChange() {
    _errorTargetName = null;
    _errorNominal = null;
    _errorPeriod = null;

    notifyListeners();
  }
}