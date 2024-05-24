import 'package:flutter/material.dart';
import '../util/date_util.dart';

class HeatMapWeekText extends StatelessWidget {
  /// The margin value for correctly space between labels.
  final EdgeInsets? margin;

  /// The double value of label's font size.
  final double? fontSize;

  /// The double value of every block's size to fit the height.
  final double? size;

  /// The color value of every font's color.
  final Color? fontColor;

  /// Customizable Week Label
  final List<Widget>? weekLabelWidgets;

  HeatMapWeekText({
    Key? key,
    this.margin,
    this.fontSize,
    this.size,
    this.fontColor,
    this.weekLabelWidgets,
  })  : assert(weekLabelWidgets!.length <= DateUtil.WEEK_LABEL.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!(weekLabelWidgets?.isEmpty ?? true)) ...weekLabelWidgets!,
        for (String label in DateUtil.WEEK_LABEL)
          Container(
            height: size ?? 20,
            margin: margin ?? const EdgeInsets.all(2.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 12,
                color: fontColor,
              ),
            ),
          ),
      ],
    );
  }
}
