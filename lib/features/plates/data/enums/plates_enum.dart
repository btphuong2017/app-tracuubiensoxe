enum VehicleType {
  motobike(
    type: 'motorbike',
    platePattern: r'^\d{2}(?:[A-Za-z]{2}|[A-Za-z]\d)-\d{4,5}$',
  ),
  car(type: 'car', platePattern: r'^\d{2}[A-Za-z]{1,2}-\d{4,5}$');

  const VehicleType({required this.type, required this.platePattern});

  final String type;
  final String platePattern;
}
