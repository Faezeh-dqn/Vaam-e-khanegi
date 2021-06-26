import 'package:flutter/material.dart';

class VariziPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 180,
                    height: 70,
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'واریزی جدید',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    height: 70,
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'تاریخچه واریزی ها',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
