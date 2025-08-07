String getTimezoneName(String fullTimezone) {
  return fullTimezone.split('/').last.replaceAll('_', ' ');
}
