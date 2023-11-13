import 'package:battleships/theme.dart';
import 'package:flutter/material.dart';

import '../structs/ship.dart';

class Board {
  late List<Ship?> grid;

  Board(int size) {
    grid = List<Ship?>.generate(size * size, (index) => null);
  }

  void placeShip(int index, Ship ship) {
    // Implement logic to place ship on the board
    // Check for valid placement, avoiding overlap with other ships
    // You may want to handle edge cases based on the ship's rotation
  }
}

class ShipPlacementScreen extends StatefulWidget {
  const ShipPlacementScreen({Key? key}) : super(key: key);

  @override
  _ShipPlacementScreenState createState() => _ShipPlacementScreenState();
}

class _ShipPlacementScreenState extends State<ShipPlacementScreen> {
  final int boardSize = 10; // Change this based on your requirement
  final int maxShips = 10; // 1x4, 2x3, 3x2, 4x1
  Board board = Board(10);

  @override
  Widget build(BuildContext context) {
    final isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final boardHeight = screenHeight * 0.8;
    final forVerticalshipsSectionHeight = screenHeight * 0.2;
    final forHorizontalshipsSectionWidth = screenWidth * 0.2;

    print(boardHeight);

    return Scaffold(
      body: isHorizontal
          ? _buildHorizontalLayout(boardHeight, forVerticalshipsSectionHeight)
          : _buildVerticalLayout(boardHeight, forHorizontalshipsSectionWidth),
    );
  }

  Widget _buildHorizontalLayout(
      double boardHeight, double forHorizontalshipsSectionWidth) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            height: boardHeight,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: boardSize,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle ship placement here
                    if (board.grid[index] == null) {
                      Ship newShip =
                          Ship(rotation: 'l', size: 1); // Customize as needed
                      board.placeShip(index, newShip);
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: forHorizontalshipsSectionWidth,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: board.grid[index]?.isHit == true
                          ? Icon(Icons.close)
                          : Text(
                              board.grid[index]?.size.toString() ?? '',
                              style: TextStyle(fontSize: 18.0),
                            ),
                    ),
                  ),
                );
              },
              itemCount: boardSize * boardSize,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: boardHeight,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: availShipsSectionBackgroundColor,
            child: ListView.builder(
              itemBuilder: (context, index) {
                // Generate a list of available ships (images or other widgets)
                return ListTile(
                  title: Text('Ship ${index + 1}'), // TODO: change to photo
                  // Add ship images or other widgets here
                );
              },
              itemCount: maxShips,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(double boardHeight, double shipsSectionHeight) {
    return Column(
      children: [
        Container(
          height: boardHeight,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: boardSize,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle ship placement here
                  if (board.grid[index] == null) {
                    Ship newShip =
                        Ship(rotation: 'l', size: 1); // Customize as needed
                    board.placeShip(index, newShip);
                    setState(() {});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: board.grid[index]?.isHit == true
                        ? Icon(Icons.close)
                        : Text(
                            board.grid[index]?.size.toString() ?? '',
                            style: TextStyle(fontSize: 18.0),
                          ),
                  ),
                ),
              );
            },
            itemCount: boardSize * boardSize,
          ),
        ),
        Container(
          height: shipsSectionHeight,
          color: Colors.grey[200],
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Generate a list of available ships (images or other widgets)
              return Container(
                width: 80.0, // Adjust as needed
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Ship ${index + 1}'),
                  // Add ship images or other widgets here
                ),
              );
            },
            itemCount: maxShips,
          ),
        ),
      ],
    );
  }
}
