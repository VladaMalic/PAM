import 'dart:math'; // Pentru pow
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';// Pentru inputFormatters

void main() => runApp(const MyMainPage());

class MyMainPage extends StatelessWidget {
  const MyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyMainLoanCalc(),
    );
  }
}

class MyMainLoanCalc extends StatefulWidget {
  const MyMainLoanCalc({super.key});

  @override
  _MyMainLoanCalcState createState() => _MyMainLoanCalcState();
}

class _MyMainLoanCalcState extends State<MyMainLoanCalc> {
  double _numberOfMonths = 6; // Valoarea inițială a slider-ului
  double _monthlyPayment = 0; // Valoarea inițială a plății lunare
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _percentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loan Calculator',
          style: TextStyle(
            fontSize: 38,
            fontFamily: 'Noto_Sans_extraBold',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60, bottom: 5, left: 20, right: 20),
              child: Text(
                'Enter amount',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Noto_Sans_bold',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                  child: SizedBox(
                    width: 370,
                    child: TextField(
                      controller: _amountController,
                      style: const TextStyle(
                        fontFamily: 'Noto_Sans_bold',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: const TextStyle(
                          fontFamily: 'Noto_Sans_bold',
                          fontSize: 16,
                          color: Colors.black12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Text(
                'Enter number of months',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Noto_Sans_bold',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.indigo,
                  inactiveTrackColor: Colors.indigo.withOpacity(0.5),
                  thumbColor: Colors.indigo,
                  overlayColor: Colors.indigo.withOpacity(0.2),
                  trackHeight: 4.0,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
                ),
                child: Slider(
                  value: _numberOfMonths,
                  min: 1,
                  max: 60,
                  divisions: 59,
                  label: _numberOfMonths.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _numberOfMonths = value;
                    });
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
              child: Text(
                'Enter % per month',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Noto_Sans_bold',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                  child: SizedBox(
                    width: 370,
                    child: TextField(
                      controller: _percentController,
                      style: const TextStyle(
                        fontFamily: 'Noto_Sans_bold',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Percent',
                        labelStyle: const TextStyle(
                          fontFamily: 'Noto_Sans_bold',
                          fontSize: 16,
                          color: Colors.black12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E4ED),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      spreadRadius: 5,
                      blurRadius: 4,
                    ),
                  ],
                ),
                width: 350,
                height: 200,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'You will pay the\napproximate amount\nmonthly:',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Noto_Sans_extraBold',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '\$${_monthlyPayment.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Noto_Sans_bold',
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: SizedBox(
                width: 385,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double amount = double.tryParse(_amountController.text) ?? 0;
                      double percent = double.tryParse(_percentController.text) ?? 0;
                      double monthlyInterestRate = percent / 100;
                      _monthlyPayment = (amount * monthlyInterestRate) /
                          (1 - 1 / pow(1 + monthlyInterestRate, _numberOfMonths));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Noto_Sans_bold',
                    ),
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






