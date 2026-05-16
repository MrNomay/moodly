import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class AppRichText extends StatelessWidget {
  final InlineSpan text;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final bool softWrap;

  const AppRichText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
