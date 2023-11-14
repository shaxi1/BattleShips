class Ship {
  String rotation; // 'left', 'right', 'down', 'up'
  bool isHit;
  int size;
  String shipPart; // 'edge' - head or tail, 'middle', 'water'

  Ship(
      {required this.rotation,
      this.isHit = false,
      required this.size,
      required this.shipPart});
}
