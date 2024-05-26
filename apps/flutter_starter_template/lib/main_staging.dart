import 'package:flutter/material.dart';
import 'package:flutter_starter_template/flavors.dart';
import 'package:flutter_starter_template/routing/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(Flavor.staging);
}
