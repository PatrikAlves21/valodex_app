import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/app_colors.dart';

extension TextExtension on Text {
  Text h1({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
        fontSize: 48.sp, fontWeight: FontWeight.w500, color: fontColorPrimary);
    return Text(
      data!,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
    );
  }

  Text h2({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w500, color: fontColorPrimary);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h3({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w500, color: fontColorPrimary);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h4({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: fontColorPrimary);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h5({TextStyle? style}) {
    final TextStyle defaultStyle = TextStyle(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: fontColorPrimary);
    return Text(data!,
        key: key,
        locale: locale,
        maxLines: maxLines,
        overflow: overflow,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }
}
