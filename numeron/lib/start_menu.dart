import 'package:flutter/material.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "NumerOn",
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    )),
                child: const Text("ゲーム開始"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
