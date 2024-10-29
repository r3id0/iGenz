import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? calculateUserAge(DateTime birthdate) {
  DateTime now = DateTime.now();
  int age = now.year - birthdate.year;

  // Adjust for leap years
  if (now.month < birthdate.month ||
      (now.month == birthdate.month && now.day < birthdate.day)) {
    age--;
  }

  return age;
}

DateTime? convertToUTC(DateTime? localDateTime) {
  // Convert the local DateTime to UTC
  return localDateTime?.toUtc();
}

DateTime? convertToLocalTime(DateTime? utcDateTime) {
  // Convert the UTC DateTime to local DateTime
  return utcDateTime?.toLocal();
}
