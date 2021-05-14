import 'package:flutter/material.dart';
import 'package:vaam_khanegi/views/members.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MenuItems(),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff014B26),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MembersPage()),
                  );
                },
                child: Text(
                  'اعضا',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff006B35),
                child: Text(
                  'واریز ها',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff007C3D),
                onPressed: () {},
                child: Text(
                  'وام ها',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff009A4C),
                child: Text(
                  'برداشت ها',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff00BE5E),
                onPressed: () {},
                child: Text(
                  'اقساط',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: RaisedButton(
                color: Color(0xff00DA6B),
                child: Text(
                  'درآمد ها',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(right: 197),
          child: Container(
            height: 150,
            width: 150,
            child: RaisedButton(
              color: Color(0xff27FD90),
              onPressed: () {},
              child: Text(
                '''وام های  
تقاضا
شده ''',
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
