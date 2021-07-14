import 'package:flutter/material.dart';

import 'package:repoint/main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mDarkGrey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              'RePoint',
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 20.0,
              ),
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

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'RePoint',
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 20.0,
                  color: mWhite
                ),
              ),

              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(mLightGrey),
                  overlayColor: MaterialStateProperty.all<Color>(mLightGreyAlpha),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/toDo');
                },
                child: Text(
                  'ToDo',
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}