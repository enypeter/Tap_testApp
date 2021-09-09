import 'package:flutter/material.dart';
import '../utils/constants.dart';

generalButton({onTap, title, color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: onTap,
        splashColor:PRIMARY_BLUE,
        child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0.3, 0.6),
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
            color: color),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: WHITE, fontSize: 17, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    ),
  );
}

defaultButton({onTap, title}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0.3, 0.6),
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.2)),
        ],
        gradient: LinearGradient(
          stops: [0.3, 0.9],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [ACCENT_BLUE, BUTTON_BLUE],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: WHITE, fontSize: 17, fontWeight: FontWeight.w600),
        )),
      ),
    ),
  );
}
