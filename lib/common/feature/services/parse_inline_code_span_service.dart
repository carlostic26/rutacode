import 'package:flutter/material.dart';

List<InlineSpan> parseInlineCodeSpans(String input) {
  final spans = <InlineSpan>[];
  final regex = RegExp(r'`([^`]+)`');
  int start = 0;

  for (final match in regex.allMatches(input)) {
    if (match.start > start) {
      spans.add(TextSpan(
        text: input.substring(start, match.start),
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      ));
    }

    spans.add(WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          match.group(1)!,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            color: Color(0xFF80CBC4),
          ),
        ),
      ),
    ));

    start = match.end;
  }

  if (start < input.length) {
    spans.add(TextSpan(
      text: input.substring(start),
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 16,
      ),
    ));
  }

  return spans;
}
