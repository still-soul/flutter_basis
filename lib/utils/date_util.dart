String formatDateStr(String date) {
  DateTime dateTime = DateTime.parse(date);
  return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
}