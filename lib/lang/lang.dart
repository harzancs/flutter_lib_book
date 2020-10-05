import 'dart:convert';

import 'package:flutter/services.dart';

class Translations {
  load(String lang, String key) async {
    String jsonContent =
        await rootBundle.loadString("assets/lang/lang_th.json");
    Map _localisedValues = json.decode(jsonContent);
    return _localisedValues[key];
  }
}
