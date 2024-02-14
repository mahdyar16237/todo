import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'enUs.dart';
import 'faIR.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'fa_IR': faIR};

  Locale locale = Locale("fa", "IR");
  Locale fallback = Locale("en", "USََ");

  static final langs = ["Farsi", "English"];

  static final locales = [Locale("fa", "IR"), Locale("en", "US")];

  void changeLocale(String loc) {
    Locale loclae = getLocaleFromText(loc)!;
    Get.updateLocale(loclae);
    final box = GetStorage();
    box.write("lng", loc);
  }

  Locale? getLocaleFromText(String text) {
    for (int i = 0; i < locales.length; i++) {
      if (langs[i] == text) return locales[i];
    }
    return Get.locale;
  }

  Locale getCureentLocale() {
    Locale locale;
    final box = GetStorage();
    String? loc = box.read("lng");
    if (loc == null) {
      locale = fallback;
    } else {
      locale = getLocaleFromText(loc)!;
    }
    return locale;
  }
}
