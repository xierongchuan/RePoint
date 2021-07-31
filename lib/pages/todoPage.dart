import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:repoint/main.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({ Key? key }) : super(key: key);
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  List toDoList = [];

  String _userToDo = '';

  String displayName = '';

  @override
  void initState() {

    getData();

    toDoList.add('KitKat x40');
    toDoList.add('Danissimo x100');
    toDoList.add('Sprite x10');
    toDoList.add('Fanta x20');
    toDoList.add('SSD 2TB x2');
    toDoList.add('HDD 8TB x2');
    toDoList.add('RAM 16GB DDR4 x8');
    toDoList.add('ASRock TRX 40 Taichi');
    toDoList.add('Cougar Conquer');
    toDoList.add('AMD Threadripper 3');
    toDoList.add('AMD Radeon RX 6900');
    toDoList.add('ATX 980W');

    super.initState();
  }

  getData() async {
    SharedPreferences LDB = await SharedPreferences.getInstance();
    setState(() {
      displayName = LDB.getString('displayName') ?? 'NULL';
    });
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 20.0,
                ),
              ),
            ),
            body: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15),),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(mLightGrey),
                    overlayColor: MaterialStateProperty.all<Color>(mLightGreyAlpha),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: Text(
                    'Main menu',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mDarkGrey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [

            Text(
              'ToDo',
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 20.0,
              ),
            ),

            IconButton(
              icon: Icon(Icons.menu_outlined),
              onPressed: _menuOpen,
            ),


            // OutlinedButton(
            //   style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all<Color>(mLightGrey),
            //     overlayColor: MaterialStateProperty.all<Color>(mLightGreyAlpha),
            //   ),
            //   onPressed: () {},
            //   child: Text(
            //     'Save',
            //     style: TextStyle(
            //       fontFamily: 'Google',
            //       fontSize: 20.0,
            //     ),
            //   ),
            // ),

          ],
        ),
      ),

      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(toDoList[index]),
              child: Card(
                color: mGrey,
                child: ListTile(
                  title: Text(
                    toDoList[index],
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 20.0,
                      color: mWhite,
                    ),
                  ),
                  trailing: Icon(
                    Icons.swipe_rounded,
                    color: mRed,
                    size: 20.0,
                  ),
                ),
              ),
              onDismissed: (direction) {
                // if(direction == DismissDirection.endToStart) print('Left');
                // if(direction == DismissDirection.startToEnd) print('Right');
                setState(() {
                  var tIndex = index;
                  var tTodo = toDoList[index];

                  toDoList.removeAt(index);

                  final snackBarCancell = SnackBar(
                    duration: Duration(milliseconds: 2000),
                    backgroundColor: mGrey,
                    content: Text(
                      'Deleted',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    action: SnackBarAction(
                      label: 'Cancell',
                      textColor: mBlue,
                      onPressed: () {
                        setState(() {
                          toDoList.insert(tIndex ,tTodo);
                        });
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarCancell);

                  // print(toDoList);
                });
              },
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: mGreen,
        child: Icon(
          Icons.add_box_outlined,
          color: mGrey,
          size: 27.5,
        ),
        onPressed: () async {
          SharedPreferences LDB = await SharedPreferences.getInstance();
          LDB.setString('displayName', 'ToDo');
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: mDarkGrey,
              title: Text(
                'Add element',
                style: TextStyle(
                  fontFamily: 'Google',
                  color: mWhite,
                ),
              ),
              content: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  // focusColor: mLightGrey,
                  // hoverColor: mLightGrey,
                  // fillColor: mLightGrey,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),

                ),
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(mGreen),
                    overlayColor: MaterialStateProperty.all<Color>(mLightGreyAlpha),
                  ),
                  onPressed: () {

                    setState(() {
                      toDoList.insert(0 ,_userToDo);
                      _userToDo = '';
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            );
          });
        },
      ),

    );
  }
}
