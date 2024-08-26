String getDurationTextHabits(
    {required Duration? duration, required bool isDoneHabits}) {
  switch (duration?.inHours) {
    case const (24):
      return isDoneHabits ? "Done Habits Last Day" : "Ongoing Habits Last Day";
    case const (24 * 7):
      return isDoneHabits
          ? "Done Habits Last 7 Days"
          : "Ongoing Habits Last 7 Days";
    case const (24 * 28):
      return isDoneHabits
          ? "Done Habits Last 28 Days"
          : "Ongoing Habits Last 28 Days";
    case null:
      return isDoneHabits ? "All Done Habits" : "All Ongoing Habits";

    default:
      return isDoneHabits ? "All Done Habits" : "All Ongoing Habits";
  }
}
