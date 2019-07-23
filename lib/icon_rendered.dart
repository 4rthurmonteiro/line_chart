import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

///
/// This is used to show that legend symbols can be assigned a custom symbol.
class IconRenderer extends charts.RectSymbolRenderer {
  final IconData iconData;

  IconRenderer(this.iconData);

  @override
  Widget build(BuildContext context,
      {Size size, Color color, bool isSelected}) {
    return new SizedBox.fromSize(
        size: size, child: new Icon(iconData, color: color, size: 12.0));
  }
}
