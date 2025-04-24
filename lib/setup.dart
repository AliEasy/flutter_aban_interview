import 'package:flutter/cupertino.dart';
import 'package:flutter_aban_interview/core/di/base/di_setup.dart';

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
}
