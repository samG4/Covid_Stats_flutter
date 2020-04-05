import 'dart:ui';

import 'package:flutter/material.dart';

//API URLS
const String API_INFECTED_MAIN = "https://api.covid19india.org/data.json";
const String API_WIKI = "https://api.covid19india.org/website_data.json";
const String API_INFECTED_STATE_WISE =
    "https://api.covid19india.org/state_district_wise.json";

//styles
const kHeadingTextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 2,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.double,
);

const kBodyTextStyle =
    TextStyle(fontSize: 20.0, letterSpacing: 2, color: Colors.black);
