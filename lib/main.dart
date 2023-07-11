import 'package:flutter/material.dart';

void main() {
  runApp(SeatFinderApp());
}

class SeatFinderApp extends StatefulWidget {
  @override
  _SeatFinderAppState createState() => _SeatFinderAppState();
}

class GridBox {
  Color color;

  GridBox({this.color = Colors.lightBlue});
}

class _SeatFinderAppState extends State<SeatFinderApp> {
  Color buttonColor = Colors.grey;
  String seatNumber = '';

  void changeButtonColor() {
    setState(() {
      buttonColor = seatNumber.isEmpty ? Colors.grey : Colors.blue;
    });
  }

  List<GridBox> gridBoxes = List<GridBox>.generate(60, (index) => GridBox());

  void findSeat() {
    setState(() {
      // Check if the seat number exists in the grid
      if (seatNumber.isNotEmpty) {
        int index = int.parse(seatNumber) - 1;
        if (index >= 0 && index < 60) {
          // Change the background color of the corresponding grid box to green
          gridBoxes[index].color = Colors.green;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //designing APPBAR
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Seat Finder',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 200.0),
                      //TEXTFIELD to enter the SEAT NUMBER
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            seatNumber = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Seat Number..',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 16.0),
                  Container(
                    height: 60,
                    width: 90,
                    //button labelled with FIND
                    child: ElevatedButton(
                      onPressed: () {
                        //function calling
                        changeButtonColor();
                        findSeat();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                        ),
                      ),
                      child: const Text('Find'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // MAking Boxes using Gridview
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 60,
                    itemBuilder: (context, index) {
                      //  it checks if the index corresponds to the last column in each row of the grid.
                      //designing last column that contains SIDE LOWER, SIDE UPPER seats
                      if (index % 5 == 4) {
                        return Container(
                          color: gridBoxes[index].color,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (index == 9)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              const SizedBox(height: 4.0),
                              if (index == 4)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 14)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 19)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 24)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 29)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 34)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 39)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 44)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 49)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 54)
                                const Text(
                                  'Side lower',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (index == 59)
                                const Text(
                                  'Side Upper',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        );

                      // designing LOWER,MIDDLE,UPPER seats
                      } else if (index % 5 == 0) {
                        return Container(
                          color: gridBoxes[index].color,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Lower',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (index % 5 == 1) {
                        return Container(
                          color: gridBoxes[index].color,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Middle',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (index % 5 == 2) {
                        return Container(
                          color: gridBoxes[index].color,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Upper',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox
                            .shrink(); // Create a gap where the 4th column would be
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
