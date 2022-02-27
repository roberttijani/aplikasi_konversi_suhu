import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      _reamur = 4 / 5 * _inputUser;
      _kelvin = _inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Suhu Converter"),
          ),
          body: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Masukkan Nilai Suhu celcius"),
                    keyboardType: TextInputType
                        .number, //agar hanya angka yg bisa dimasukkan
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: etInput,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Suhu Dalam Kelvin",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            '$_kelvin',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Suhu Dalam Reamur",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            '$_reamur',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: konversi,
                        color: Colors.blue,
                        textColor: Colors.black,
                        child: const Text("Konversi"),
                      ))
                ],
              )),
        ));
  }
}
