extension StringExtension on String {
  int get colorValue {
    var newColor = split("#")[1];
    newColor = "0xff$newColor";
    return int.parse(newColor);
  }
}
