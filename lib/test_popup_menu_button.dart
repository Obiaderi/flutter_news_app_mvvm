import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum Menu { itemOne, itemTwo, itemThree, itemFour }

class TestPopupMenuButton extends StatefulWidget {
  const TestPopupMenuButton({Key? key}) : super(key: key);

  @override
  State<TestPopupMenuButton> createState() => _TestPopupMenuButtonState();
}

class _TestPopupMenuButtonState extends State<TestPopupMenuButton> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
            onSelected: (Menu item) {
              // print(item);
              setState(() {
                _selectedMenu = item.name;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: Text('Item 3'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemFour,
                child: Text('Item 4'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('_selectedMenu: $_selectedMenu'),
      ),
    );
  }
}
