
class AppConstants{

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }

}