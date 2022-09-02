import 'package:flutter/material.dart';

class NavAddWidget extends StatelessWidget {
  final VoidCallback? callback;

  NavAddWidget({this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback!();
        }
      },
      child: UnconstrainedBox(
        child: Container(
          width: 44,
          height: 44,
          child: Container(
              margin: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
