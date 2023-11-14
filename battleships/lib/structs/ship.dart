class Ship {
  String rotation; // 'left', 'right', 'down', 'up'
  bool isHit;
  int size;

  Ship({required this.rotation, this.isHit = false, required this.size});
}
