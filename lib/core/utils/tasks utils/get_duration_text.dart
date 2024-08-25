String getDurationText({required Duration? duration}) {
  switch (duration?.inHours) {
    case const (24):
      return "Finished Tasks Last Day";
    case const (24 * 7):
      return "Finished Tasks Last 7 Days";
    case const (24 * 28):
      return "Finished Tasks Last 28 Days";
    case null:
      return "All Finished Tasks";

    default:
      return "All Finished Tasks";
  }
}
