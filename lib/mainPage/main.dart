import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class FirstHomework extends StatelessWidget {
  FirstHomework({Key? key}) : super(key: key);
  dynamic isFocussed = false;

  // TextEditingController textFromInput = new TextEditingController();
  dynamic textFromInput;
  dynamic valueConverted;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: myFirstHomeworkPage());
  }
}

class myFirstHomeworkPage extends StatefulWidget {
  const myFirstHomeworkPage({Key? key}) : super(key: key);

  @override
  _myFirstHomeworkPage createState() => _myFirstHomeworkPage();
}

class _myFirstHomeworkPage extends State<myFirstHomeworkPage> {
  double? _convertedValue;
  final _textController = TextEditingController();
  dynamic isFocussed = false;
  bool firstPress=false;

  void _convert() {
    final double? enteredValue = double.tryParse(_textController.text);
    setState(() {
      _convertedValue = enteredValue != null ? enteredValue * 4.5 : null;
      firstPress=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(
                "https://www.zdg.md/wp-content/uploads/2020/07/bani-1920x1020-c-default.jpg",
                fit: BoxFit.fitHeight),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: FocusScope(
                child: Focus(
                  onFocusChange: (focus) => isFocussed = focus,
                  child: (TextFormField(
                    autofocus: true,
                    decoration:  InputDecoration(
                        hintText: "enter the amount in EURO",
                        errorText: (_convertedValue == null&&firstPress)?"please enter a number":null),
                    keyboardType: TextInputType.number,
                    controller: _textController,

                  )),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _convert,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xDCE7E7E7))),
              child: const Text(
                'CONVERT!',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Text(_convertedValue!=null?"$_convertedValue":"")
          ],
        ),
      ),
    );
  }
}
