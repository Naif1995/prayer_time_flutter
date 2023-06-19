enum PrayerTime {
  fajr,
  dhuhr,
  asr,
  maghrib,
  isha
}

extension PrayerTimeExtension on PrayerTime {
  String get nameInEnglish {
    switch (this) {
      case PrayerTime.fajr:
        return 'Fajr';
      case PrayerTime.dhuhr:
        return 'Dhuhr';
      case PrayerTime.asr:
        return 'Asr';
      case PrayerTime.maghrib:
        return 'Maghrib';
      case PrayerTime.isha:
        return 'Isha';
      default:
        return '';
    }
  }

  String get nameInArabic {
    switch (this) {
      case PrayerTime.fajr:
        return 'الفجر';
      case PrayerTime.dhuhr:
        return 'الظهر';
      case PrayerTime.asr:
        return 'العصر';
      case PrayerTime.maghrib:
        return 'المغرب';
      case PrayerTime.isha:
        return 'العشاء';
      default:
        return '';
    }
  }

  String get nameInBothLanguages {
    switch (this) {
      case PrayerTime.fajr:
        return 'Fajr - الفجر';
      case PrayerTime.dhuhr:
        return 'Dhuhr - الظهر';
      case PrayerTime.asr:
        return 'Asr - العصر';
      case PrayerTime.maghrib:
        return 'Maghrib - المغرب';
      case PrayerTime.isha:
        return 'Isha - العشاء';
      default:
        return '';
    }
  }
}