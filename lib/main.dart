import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:log_in_theme/home.dart';
import 'package:log_in_theme/login_page.dart';
import 'package:log_in_theme/storage_utlies.dart';

void main() async {
  await GetStorage.init();
  runApp(MaterialApp(
    home: StorageUtiles.isFirstTimeLogin() ? SignUpPage() : Home(),
    debugShowCheckedModeBanner: false,
  ));
}
