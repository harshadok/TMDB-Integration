import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({Key? key, this.text, this.colur, this.size})
      : super(key: key);
  final String? text;
  final Color? colur;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: GoogleFonts.breeSerif(
          color: colur ?? Colors.white, fontSize: size ?? 18),
    );
  }
}
