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
          HeatMapWeekTextContainerWidget(
            size: size,
            margin: margin,
            label: label,
            fontSize: fontSize,
            fontColor: fontColor,
          ),
      ],
    );
  }
}

class HeatMapWeekTextContainerWidget extends StatelessWidget {
  const HeatMapWeekTextContainerWidget({
    Key? key,
    required this.size,
    required this.margin,
    required this.label,
    required this.fontSize,
    required this.fontColor,
  }) : super(key: key);

  final double? size;
  final EdgeInsets? margin;
  final String label;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 20,
      margin: margin ?? const EdgeInsets.all(2.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 12,
          color: fontColor,
        ),
      ),
    );
  }
}
