import 'package:flutter/material.dart';

import 'constants.dart';

text(text, [color, fontSize, fontWeight]) => Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );

TextStyle headerStyle() =>
    TextStyle(color: WHITE, fontSize: 17, fontWeight: FontWeight.w600);
