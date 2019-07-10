import 'package:flutkart/utils/flutkart.dart';
import 'package:flutter/material.dart';
import 'package:flutkart/utils/my_navigator.dart';
import 'package:flutkart/widgets/walkthrough.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF44336),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Flukart.wt1,
                  content: Flukart.wc1,
                  imageIcon: Icons.account_box,
                ),
                Walkthrough(
                  title: Flukart.wt2,
                  content: Flukart.wc2,
                  imageIcon: Icons.account_circle,
                ),
                Walkthrough(
                  title: Flukart.wt3,
                  content: Flukart.wc3,
                  imageIcon: Icons.library_books,
                ),
                Walkthrough(
                  title: Flukart.wt4,
                  content: Flukart.wc4,
                  imageIcon: Icons.contact_phone,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Flukart.skip,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToHome(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Flukart.gotIt : Flukart.next,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToHome(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
