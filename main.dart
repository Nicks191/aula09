import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculatorApp());
}

class IMCCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String result = '';

  void calculateIMC() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double imc = weight / (height * height);
      setState(() {
        result = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        result = 'Por favor, insira valores válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
