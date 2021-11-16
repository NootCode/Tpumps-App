class AddressSetting {
  String address;
  double lat;
  double lon;
  String? title;
  String? desc;

  AddressSetting(
      {required this.address,
      required this.lat,
      required this.lon,
      this.title,
      this.desc});
}
