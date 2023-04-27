import 'package:flutter/material.dart';
import 'package:login/models/product.dart';
import 'package:provider/provider.dart';
class lottoscreen extends StatefulWidget {
  @override
  _lottoscreenState createState() => _lottoscreenState();
}

class _lottoscreenState extends State<lottoscreen> {
  // Set up a list of numbers from 1 to 52
  final List<int> _allNumbers = List.generate(52, (index) => index + 1);
  // Set up a list of 6 selected numbers
  List<int> _selectedNumbers = [];
  List<int> _listNumbers = [];
  final List<Product> products = [];

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
      } else if (_selectedNumbers.length < 6) {
        _selectedNumbers.add(number);
      }
    });
  }

  void _setNumbersList() {
    setState(() {
      if (_selectedNumbers.length == 6) {
        for (var number in _selectedNumbers) {
          if (!_listNumbers.contains(number)) {
            _listNumbers.add(number);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 20),
        Center(child: Text('Choose Numbers: ')),
        SizedBox(height: 10),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _allNumbers.map((number) {
            Color color;
            if (number >= 1 && number <= 13) {
              color = Colors.red;
            } else if (number >= 14 && number <= 26) {
              color = Colors.yellow;
            } else if (number >= 27 && number <= 38) {
              color = Colors.green;
            } else {
              color = Colors.lightBlue;
            }
            return GestureDetector(
              onTap: () => _toggleNumber(number),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedNumbers.contains(number)
                        ? Colors.blue
                        : Colors.grey,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color:
                      _selectedNumbers.contains(number) ? Colors.blue : color,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _selectedNumbers.contains(number)
                          ? Colors.blue
                          : Colors.white,
                      border: Border.all(
                        color: _selectedNumbers.contains(number)
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        number.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: _selectedNumbers.contains(number)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        // List of selected numbers
        SizedBox(height: 20),
        Center(child: Text('Selected Numbers: ')),
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
                      borderRadius: BorderRadius.circular(50),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: _generateRandomNumbers,
              child: const Text('Quick Pick'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: _setNumbersList,
              child: const Text('Add numbers'),
            ),
          ],
        ),
            Wrap(
              spacing: 10.0, // space between each item
              runSpacing: 10.0, // space between each row
              children: _listNumbers.asMap().entries.map((entry) {
                final index = entry.key;
                final number = entry.value;
                return Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          number.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _listNumbers.removeAt(index);
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    if ((index + 1) % 5 == 0)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _listNumbers.removeRange(
                                  index - 4, index + 1 > _listNumbers.length ? _listNumbers.length : index + 1);
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            )
      ]
      )
      ),
    );
  }
}
class Cart extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}