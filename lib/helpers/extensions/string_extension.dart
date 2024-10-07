extension StringExtension on String {
  String toFirstLetterUpperCase() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
