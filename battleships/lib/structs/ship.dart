class Ship {
  String rotation; // 'l', 'r', 'd', 'u'
  bool isHit;
  int size;

  Ship({required this.rotation, this.isHit = false, required this.size});
}
