import 'package:intl/intl.dart';

String formatMessageTime(DateTime date) {
  return DateFormat('hh:mm a').format(date);
}
