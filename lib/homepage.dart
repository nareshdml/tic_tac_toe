import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to add icon image
  var cross = Icon(Icons.cancel, size: 100, color: Colors.red);
  var circle = Icon(Icons.circle, size: 100, color: Colors.green);
  var edit = Icon(
    Icons.circle_outlined,
    size: 100,
  );

  bool isCross = true;
  String message = '';

  List<String> gameState = [];
  //initialize box with empty value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = '';
    super.initState();
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "circle";
        } else {
          this.gameState[index] = "cross";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //reset Game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
  }

  //to get icon image
  Icon getIcon(String title) {
    switch (title) {
      case 'empty':
        return edit;
        break;

      case 'cross':
        return cross;
        break;

      case 'circle':
        return circle;
        break;

      default:
        return edit;
    }
  }

  //to check for winning
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + 'win';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + 'win';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + 'win';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + 'win';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + 'win';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + 'win';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + 'win';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + '  win';
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 100,
                  ),
                  itemCount: gameState.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 100,
                        height: 100,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(index);
                          },
                          child: getIcon(this.gameState[index]),
                        ));
                  })),
          Text(
            this.message,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () {
                resetGame();
              },
              child: Text('Reset Game')),
        ],
      ),
    );
  }
}
