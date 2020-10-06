import 'package:hive/hive.dart';
import 'package:savana/common/theme/theme.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String icon;

  @HiveField(2)
  final int color;

  Category(this.name, this.icon, this.color);

  static Category get electronic {
    return Category(
      "Elektronik",
      "assets/svg/ic_electronic.svg",
      blueColor.value,
    );
  }

  static Category get building {
    return Category(
      "Bangunan",
      "assets/svg/ic_building.svg",
      blueColor.value,
    );
  }

  static Category get vehicle {
    return Category(
      "Kendaraan",
      "assets/svg/ic_vehicle.svg",
      blueColor.value,
    );
  }

  static Category get clothes {
    return Category(
      "Pakaian",
      "assets/svg/ic_clothes.svg",
      yellowColor.value,
    );
  }

  static Category get travel {
    return Category(
      "Perjalanan",
      "assets/svg/ic_travel.svg",
      blueColor.value,
    );
  }

  static Category get education {
    return Category(
      "Pendidikan",
      "assets/svg/ic_education.svg",
      yellowColor.value,
    );
  }

  static Category get food {
    return Category(
      "Makanan",
      "assets/svg/ic_food.svg",
      yellowColor.value,
    );
  }

  static Category get health {
    return Category(
      "Kesehatan",
      "assets/svg/ic_health.svg",
      pinkColor.value,
    );
  }

  static Category get game {
    return Category(
      "Permainan",
      "assets/svg/ic_game.svg",
      yellowColor.value,
    );
  }

  static Category get pet {
    return Category(
      "Peliharaan",
      "assets/svg/ic_pet.svg",
      pinkColor.value,
    );
  }

  static Category get gift {
    return Category(
      "Hadiah",
      "assets/svg/ic_gift.svg",
      pinkColor.value,
    );
  }

  static Category get care {
    return Category(
      "Perawatan",
      "assets/svg/ic_care.svg",
      pinkColor.value,
    );
  }

  static Category get sport {
    return Category(
      "Olahraga",
      "assets/svg/ic_sport.svg",
      yellowColor.value,
    );
  }

  static Category get entertainment {
    return Category(
      "Hiburan",
      "assets/svg/ic_entertainment.svg",
      yellowColor.value,
    );
  }

  static Category get accessories {
    return Category(
      "Aksesoris",
      "assets/svg/ic_accessories.svg",
      pinkColor.value,
    );
  }

  static Category get other {
    return Category(
      "Lainnya",
      "assets/svg/ic_other.svg",
      blueColor.value,
    );
  }
}
