import 'package:flutter/material.dart';
import 'dart:math';


class lottoscreen extends StatefulWidget {
  @override
  _lottoscreenState createState() => _lottoscreenState();
}

class _lottoscreenState extends State<lottoscreen> {
  // Set up a list of numbers from 1 to 52
  final List<int> _allNumbers = List.generate(52, (index) => index + 1);
  // Set up a list of 6 selected numbers
  List<int> _selectedNumbers = [];

  // Function to randomly generate 6 numbers
  void _generateRandomNumbers() {
    // Create a list of all numbers
    List<int> numbers = List.generate(52, (index) => index + 1);
    // Shuffle the list of numbers
    numbers.shuffle();
    // Take the first 6 numbers from the shuffled list
    List<int> selectedNumbers = numbers.sublist(0, 6);
    // Set the selected numbers state to the generated list
    setState(() {
      _selectedNumbers = selectedNumbers;
    });
  }

  // Function to toggle a number's selected state
  void _toggleNumber(int number) {
    setState(() {
      if (_selectedNumbers.contains(number)) {
        _selectedNumbers.remove(number);
      } else {
        _selectedNumbers.add(number);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lotto Ticket Selector'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Row of numbers from 1 to 52
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _allNumbers
              .map((number) => GestureDetector(
                    onTap: () => _toggleNumber(number),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedNumbers.contains(number)
                              ? Colors.blue
                              : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: _selectedNumbers.contains(number)
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        // List of selected numbers
        SizedBox(height: 20),
        Text('Selected Numbers: '),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _selectedNumbers
              .map((number) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
