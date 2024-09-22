import 'package:flutter/widgets.dart';

extension TextExtension on Text {
  Text copyWith({
    String? data,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    Color? selectionColor,
    StrutStyle? strutStyle,
    TextHeightBehavior? textHeightBehavior,
    TextScaler? textScaler,
  }) {
    return Text(
      data ?? this.data!,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      selectionColor: selectionColor ?? this.selectionColor,
      strutStyle: strutStyle ?? this.strutStyle,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textScaler: textScaler ?? this.textScaler,
    );
  }

  Text withStyle(TextStyle style) => copyWith(style: style);

  Text centered() => copyWith(textAlign: TextAlign.center);
  Text start() => copyWith(textAlign: TextAlign.start);
  Text end() => copyWith(textAlign: TextAlign.end);
  Text left() => copyWith(textAlign: TextAlign.left);
  Text right() => copyWith(textAlign: TextAlign.right);

  Text withOpacity(double opacity) => copyWith(style: style?.withOpacity(opacity));
  Text withSize(double size) => copyWith(style: style?.withSize(size));
  Text withWeight(FontWeight weight) => copyWith(style: style?.withWeight(weight));
  Text withColor(Color color) => copyWith(style: style?.withColor(color));
  Text withFamily(String family) => copyWith(style: style?.withFamily(family));
  Text withHeight(double height) => copyWith(style: style?.withHeight(height));
  Text withLSpacing(double spacing) => copyWith(style: style?.withLSpacing(spacing));
  Text withWSpacing(double spacing) => copyWith(style: style?.withWSpacing(spacing));

  Text thin() => copyWith(style: style?.thin());
  Text extraLight() => copyWith(style: style?.extraLight());
  Text light() => copyWith(style: style?.light());
  Text regular() => copyWith(style: style?.regular());
  Text medium() => copyWith(style: style?.medium());
  Text semibold() => copyWith(style: style?.semibold());
  Text bold() => copyWith(style: style?.bold());
  Text extraBold() => copyWith(style: style?.extraBold());
  Text black() => copyWith(style: style?.black());

  Text underlined() => copyWith(style: style?.underlined());
  Text italic() => copyWith(style: style?.italic());
  Text strikethrough() => copyWith(style: style?.strikethrough());
}

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withFamily(String family) => copyWith(fontFamily: family);
  TextStyle withHeight(double height) => copyWith(height: height);
  TextStyle withLSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle withWSpacing(double spacing) => copyWith(wordSpacing: spacing);

  TextStyle thin() => copyWith(fontWeight: FontWeight.w100);
  TextStyle extraLight() => copyWith(fontWeight: FontWeight.w200);
  TextStyle light() => copyWith(fontWeight: FontWeight.w300);
  TextStyle regular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle semibold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle extraBold() => copyWith(fontWeight: FontWeight.w800);
  TextStyle black() => copyWith(fontWeight: FontWeight.w900);

  TextStyle underlined() => copyWith(decoration: TextDecoration.underline);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle strikethrough() => copyWith(decoration: TextDecoration.lineThrough);
}
