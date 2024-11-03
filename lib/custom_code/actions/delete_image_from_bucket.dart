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

Future deleteImageFromBucket(
  String bucketName,
  String folderPath,
  String imageUrl,
) async {
  // Split the imageUrl to get the file name
  List<String> urlParts = imageUrl.split('/');
  String fileName = urlParts.last;

  // Initialize Supabase client
  final supabase = SupabaseClient(
    'https://patecdvuqfefhtwvrlaw.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBhdGVjZHZ1cWZlZmh0d3ZybGF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkzNDExMTEsImV4cCI6MjA0NDkxNzExMX0.0PRNBVH_aDCTiadjpNg1QMjvrrzlpC7NtbrgKkXgCIg',
  );

  // Delete the file from the backend
  final response = await supabase.storage
      .from(bucketName)
      .remove([folderPath + '/' + fileName]);
}
