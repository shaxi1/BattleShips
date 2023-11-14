import 'package:flutter/material.dart';
import 'dart:math';

import 'package:battleships/structs/ship.dart';

class ShipPlacementScreen extends StatefulWidget {
  const ShipPlacementScreen({Key? key}) : super(key: key);

  @override
  _ShipPlacementScreenState createState() => _ShipPlacementScreenState();
}

class _ShipPlacementScreenState extends State<ShipPlacementScreen> {
  late List<Ship> board;

  // Map ship sizes to corresponding image paths
  Map<int, String> shipImagePaths = {
    1: 'assets/ship_size1.png',
    2: 'assets/ship_size2.png',
    3: 'assets/ship_size3.png',
    4: 'assets/ship_size4.png',
  };

  @override
  void initState() {
    super.initState();
    int boardLength = 10;
    int boardSize = boardLength * boardLength;
    board = List.generate(
        boardSize, (index) => Ship(rotation: 'up', size: 0, shipPart: 'water'));
    _initializeShips();
    _randomizeShipRotations(boardLength);
  }

  // Function to initialize ships randomly
  void _initializeShips() {
    // Initialize ships based on the given counts
    Map<int, int> shipCounts = {1: 4, 2: 3, 3: 2, 4: 1};
    for (int shipSize in shipCounts.keys) {
      for (int i = 0; i < shipCounts[shipSize]!; i++) {
        _initializeShip(shipSize, 10);
      }
    }
  }

  int _findShipHeadIndex(int shipSize, int boardLength, int boardSize) {
    // choose random index for ship head position, based on board size, avoid edges (take into account the ship size, and the rotation up)
    Random random = Random();
    while (true) {
      int headIndex = random.nextInt(boardSize - shipSize * boardLength);
      print(headIndex);
      // check if the ship can be placed at the chosen index
      bool canPlace = true;
      for (int i = 0; i < shipSize; i++) {
        if (board[headIndex + i * boardLength].shipPart != 'water') {
          canPlace = false;
          break;
        }
      }
      if (canPlace) {
        return headIndex;
      }
    }
  }

  // All ships are initalized with rotation 'up'
  void _initializeShip(int size, int boardLength) {
    int headIndex =
        _findShipHeadIndex(size, boardLength, boardLength * boardLength);

    for (int i = 0; i < size; i++) {
      Ship ship;
      // head or tail of the ship
      if (i == 0) {
        ship = Ship(rotation: 'up', size: size, shipPart: 'head');
      } else if (i == size - 1) {
        ship = Ship(rotation: 'up', size: size, shipPart: 'tail');
      } else {
        ship = Ship(rotation: 'up', size: size, shipPart: 'middle');
      }
      board[headIndex + i * boardLength] = ship;
    }
  }

  void _randomizeShipRotations(int boardLength) {
    for (int i = 0; i < boardLength * boardLength; i++) {
      if (board[i].shipPart == 'head') {
        String rotation =
            shipRotatable(i, boardLength, board[i], getRandomRotation());
        if (rotation != '') {
          rotateShip(i, rotation, boardLength);
        }
      }
    }
  }

  String getRandomRotation() {
    Random random = Random();
    List<String> rotations = ['up', 'down', 'left', 'right'];
    int randomRotationIndex = random.nextInt(4);
    return rotations[randomRotationIndex];
  }

  String shipRotatable(
      int headIndex, int boardLength, Ship ship, String rotation) {
    String currentRotation = ship.rotation;
    int size = ship.size;
    int boardSize = boardLength * boardLength;

    if (rotation == 'up') {
      if (headIndex - size * boardLength < 0) {
        return '';
      }
      for (int i = 1; i < size; i++) {
        if (board[headIndex - i * boardLength].shipPart != 'water') {
          return '';
        }
      }
    } else if (rotation == 'down') {
      if (headIndex + size * boardLength >= boardSize) {
        return '';
      }
      for (int i = 1; i < size; i++) {
        if (board[headIndex + i * boardLength].shipPart != 'water') {
          return '';
        }
      }
    } else if (rotation == 'left') {
      if (headIndex % boardLength < size - 1) {
        return '';
      }
      for (int i = 1; i < size; i++) {
        if (board[headIndex - i].shipPart != 'water') {
          return '';
        }
      }
    } else if (rotation == 'right') {
      if (headIndex % boardLength > boardLength - size) {
        return '';
      }
      for (int i = 1; i < size; i++) {
        if (board[headIndex + i].shipPart != 'water') {
          return '';
        }
      }
    }
    return rotation;
  }

  void rotateShip(int headIndex, String rotation, int boardLength) {
    int size = board[headIndex].size;
    int boardSize = boardLength * boardLength;
    String currentShipRotation = board[headIndex].rotation;

    // Clean up remaining pieces by setting shipPart to 'water'
    for (int i = 1; i < size; i++) {
      if (currentShipRotation == 'right') {
        board[headIndex + i].shipPart = 'water';
      } else if (currentShipRotation == 'left') {
        board[headIndex - i].shipPart = 'water';
      } else if (currentShipRotation == 'up') {
        board[headIndex + i * boardLength].shipPart = 'water';
      } else if (currentShipRotation == 'down') {
        board[headIndex - i * boardLength].shipPart = 'water';
      }
    }

    if (rotation == 'right') {
      for (int i = 0; i < size; i++) {
        if (i == 0) {
          board[headIndex + i] = Ship.copy(board[headIndex + i],
              rotation: 'right', shipPart: 'head', isHit: false, size: size);
        } else if (i == size - 1) {
          board[headIndex + i] = Ship.copy(board[headIndex + i],
              rotation: 'right', shipPart: 'tail', isHit: false, size: size);
        } else {
          board[headIndex + i] = Ship.copy(board[headIndex + i],
              rotation: 'right', shipPart: 'middle', isHit: false, size: size);
        }
      }
    } else if (rotation == 'left') {
      for (int i = 0; i < size; i++) {
        if (i == 0) {
          board[headIndex - i] = Ship.copy(board[headIndex - i],
              rotation: 'left', shipPart: 'head', isHit: false, size: size);
        } else if (i == size - 1) {
          board[headIndex - i] = Ship.copy(board[headIndex - i],
              rotation: 'left', shipPart: 'tail', isHit: false, size: size);
        } else {
          board[headIndex - i] = Ship.copy(board[headIndex - i],
              rotation: 'left', shipPart: 'middle', isHit: false, size: size);
        }
      }
    } else if (rotation == 'up') {
      for (int i = 0; i < size; i++) {
        if (i == 0) {
          board[headIndex + i * boardLength] = Ship.copy(
              board[headIndex + i * boardLength],
              rotation: 'up',
              shipPart: 'head',
              isHit: false,
              size: size);
        } else if (i == size - 1) {
          board[headIndex + i * boardLength] = Ship.copy(
              board[headIndex + i * boardLength],
              rotation: 'up',
              shipPart: 'tail',
              isHit: false,
              size: size);
        } else {
          board[headIndex + i * boardLength] = Ship.copy(
              board[headIndex + i * boardLength],
              rotation: 'up',
              shipPart: 'middle',
              isHit: false,
              size: size);
        }
      }
    } else if (rotation == 'down') {
      for (int i = 0; i < size; i++) {
        if (i == 0) {
          board[headIndex - i * boardLength] = Ship.copy(
              board[headIndex - i * boardLength],
              rotation: 'down',
              shipPart: 'head',
              isHit: false,
              size: size);
        } else if (i == size - 1) {
          board[headIndex - i * boardLength] = Ship.copy(
              board[headIndex - i * boardLength],
              rotation: 'down',
              shipPart: 'tail',
              isHit: false,
              size: size);
        } else {
          board[headIndex - i * boardLength] = Ship.copy(
              board[headIndex - i * boardLength],
              rotation: 'down',
              shipPart: 'middle',
              isHit: false,
              size: size);
        }
      }
    }
  }

  void _confirmShipPlacement() {
    // Handle ship placement confirmation logic here
    print('Ship placement confirmed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battleship Board'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        orientation == Orientation.portrait ? 10 : 15,
                  ),
                  itemBuilder: (context, index) {
                    Ship ship = board[index];
                    String imagePath;
                    if (ship.shipPart == 'water') {
                      imagePath =
                          'assets/water.png'; // Change this to your water image
                    } else {
                      imagePath = shipImagePaths[ship.size] ?? '';
                    }

                    // Rotate the image if ship's rotation is not 'up'
                    Widget imageWidget = ship.rotation != 'up'
                        ? Transform.rotate(
                            angle: ship.rotation == 'right' ? -pi / 2 : pi / 2,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          );

                    // Add borders to simulate grid lines
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: imageWidget,
                    );
                  },
                  itemCount: board.length,
                ),
              ),
              ElevatedButton(
                onPressed: _confirmShipPlacement,
                child: Text('Confirm Ship Placement'),
              ),
            ],
          );
        },
      ),
    );
  }
}
