// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addIDtoArray(
  String? userID,
  String rowID,
  String tablename,
  String columname,
) async {
  final response = await Supabase.instance.client
      .from(tablename)
      .select(columname)
      .eq('id', rowID)
      .execute();

  final data = response.data;

  if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
    final List<dynamic> newlist = data[0][columname] ?? [];
    newlist.add(userID);

    final updateResponse = await Supabase.instance.client
        .from(tablename)
        .update({columname: newlist})
        .eq('id', rowID)
        .execute();
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
