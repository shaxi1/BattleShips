class Ship {
  late String rotation; // 'left', 'right', 'down', 'up'
  late bool isHit;
  late int size;
  late String shipPart; // 'head' or 'tail', 'middle', 'water'

  Ship(
      {required this.rotation,
      this.isHit = false,
      required this.size,
      required this.shipPart});

  Ship.copy(Ship original,
      {String? rotation, int? size, String? shipPart, bool? isHit}) {
    this.rotation = rotation ?? original.rotation;
    this.size = size ?? original.size;
    this.shipPart = shipPart ?? original.shipPart;
    this.isHit = isHit ?? original.isHit;
  }
}
