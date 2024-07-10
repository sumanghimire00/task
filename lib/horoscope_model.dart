class Horoscope {
  final String name;
  final String dateRange;
  final String? imagePath;
  final String details;

  Horoscope({
    required this.name,
    required this.dateRange,
    this.imagePath,
    required this.details,
  });
}
