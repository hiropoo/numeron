import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Numeron extends StatefulWidget {
  final String title;
  const Numeron({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _NumerOnState();
}

class _NumerOnState extends State<Numeron> {
  // State
  String _inputNumber = ""; // 入力
  String _correctNumber = ''; // 正解
  String _result = "RESULT";
  String _passNumLabel = "****";

  // コンストラクタ
  _NumerOnState() {
    _correctNumber = makePass();
  }

  String makePass() {
    List<String> list = [];

    for (var i = 0; i < 10; i++) {
      list.add(i.toString());
    }

    list.shuffle();

    return list[0] + list[1] + list[2] + list[3];
  }

  // 正誤判定計算
  String judge() {
    int eat = 0;
    int bite = 0;
    String passNum = "";
    String inputNum = "";

    for (var i = 0; i < 4; i++) {
      passNum = _correctNumber[i];
      inputNum = _inputNumber[i];

      bool match = (passNum == inputNum);
      bool isContained = _inputNumber.contains(passNum);

      if (match) {
        eat++;
      } else if (isContained) {
        bite++;
      }
    }

    if (eat == 4) {
      setState(() {
        _passNumLabel = _correctNumber;
      });
    }

    return "$eat eat  $bite bite";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _result,
              style: const TextStyle(
                fontSize: 45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                _passNumLabel,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                keyboardType: TextInputType.number,//数字のキーボードを表示
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],//数字のみ入力可にする
                onChanged: ((text) {
                  _inputNumber = text;
                }),
                textAlign: TextAlign.center,
                cursorColor: Colors.lightBlueAccent[100],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    labelText: "数字を入力"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_inputNumber.length == 4) {
                    setState(() {
                      _result = judge();
                    });
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Guess",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = "RESULT";
                    _passNumLabel = "****";
                    _correctNumber = makePass();
                  });
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Restart",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.cached_outlined,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.keyboard_double_arrow_left,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Text(
                    "Menu ",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
