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
      if (i == 0 || i == size - 1) {
        ship = Ship(rotation: 'up', size: size, shipPart: 'edge');
      } else {
        ship = Ship(rotation: 'up', size: size, shipPart: 'middle');
      }
      board[headIndex + i * boardLength] = ship;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battleship Board'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 10 : 15,
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
          );
        },
      ),
    );
  }
}
