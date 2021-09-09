import 'package:flutter/material.dart';
import '../utils/constants.dart';

bottomLine(flex, opacity) => Expanded(
    flex: flex,
    child: Container(
      height: 1,
      color: WHITE.withOpacity(opacity),
    ));

circleContainer(title) => Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            stops: [0.3, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ACCENT_BLUE, BUTTON_BLUE],
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.3, 0.4),
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.4)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: WHITE),
        )),
      ),
    );

Divider line() => Divider(
      color: PRIMARY_BLUE,
      thickness: 1.2,
    );

profileItem({title, desc}) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      color: WHITE, fontSize: 16, fontWeight: FontWeight.w200),
                ),
              ),
              Expanded(
                child: Text(
                  desc,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: WHITE, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        line(),
      ],
    );


slideDot(opacity) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: WHITE.withOpacity(opacity),
        ),
      ),
    );

likeDislikeButton({icon, onTap}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        splashColor: ACCENT_BLUE,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 1],
              colors: [
                PRIMARY_BLUE.withOpacity(0.9),
                PRIMARY_BLUE.withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              icon,
              height: 22,
            ),
          ),
        ),
      ),
    );
