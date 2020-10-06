part of 'utils.dart';

int getNominalPerDay(int nominal, int periode, String durationType) {
  switch(durationType) {
    case 'Hari':
      return (nominal ~/ (periode * 1)).round();
      break;
    case 'Pekan':
      return (nominal ~/ (periode * 7)).round();
      break;
    case 'Bulan':
      return (nominal ~/ (periode * 30)).round();
      break;
    default:
      return (nominal ~/ (periode * 365)).round();
  }
}

String getPercent(int currentMoney, int nominal) {
  double result = (currentMoney * 100) / nominal;
  if (result >= 1) {
    return result.floor().toString();
  }
  return result.toStringAsFixed(1);
}

double getPercentDouble(int currentMoney, int nominal) {
  return currentMoney / nominal;
}

String generateZeroDigit(String nominal) {
  if (nominal.lastIndexOf('.') != -1) {
    return nominal.substring(0, nominal.lastIndexOf('.')) + ".000 / Hari";
  }
  return nominal + " / Hari";
}