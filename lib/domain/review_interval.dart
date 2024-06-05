enum ReviewInterval {
  short,
  medium,
  large;

 static Duration intervalDuration(ReviewInterval interval) => switch (interval) {
        short => const Duration(minutes: 5),
        medium => const Duration(minutes: 10),
        large => const Duration(minutes: 15),
      };
}
