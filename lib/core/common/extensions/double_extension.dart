import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String formatPrice(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: Localizations.localeOf(context).toString(), symbol: '\$');
    return formatter.format(this);
  }
}
