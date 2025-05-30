import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';

class CodeDetailWidget extends ConsumerStatefulWidget {
  const CodeDetailWidget({super.key, required this.detail});

  final DetailContentModel detail;

  @override
  ConsumerState<CodeDetailWidget> createState() => _CodeDetailWidgetState();
}

class _CodeDetailWidgetState extends ConsumerState<CodeDetailWidget> {
  double _fontSize = 15;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 8) _fontSize -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String code = widget.detail.codeExample.toString();
    const theme = darculaTheme;

    // Personalización manual del tema como alternativa
    final customTheme = {
      ...darculaTheme,
      'root': TextStyle(
          backgroundColor: Colors.grey[900]), // Fondo oscuro garantizado
    };

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 8, 8, 1),
        child: Column(
          children: [
            // Barra de herramientas separada
            Container(
              color: const Color.fromARGB(66, 35, 35, 35),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Guía o ejemplo:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(CupertinoIcons.zoom_in),
                    onPressed: _increaseFontSize,
                    color: Colors.white,
                    iconSize: 20,
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.zoom_out),
                    onPressed: _decreaseFontSize,
                    color: Colors.white,
                    iconSize: 20,
                  ),
                ],
              ),
            ),
            // Área del código
            /*   Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: HighlightView(
                    code,
                    language: 'dart',
                    theme: theme,
                    padding: const EdgeInsets.all(12),
                    textStyle: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: _fontSize,
                    ),
                  ),
                ),
              ),
            ), */

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: HighlightView(
                  code,
                  language: 'dart',
                  theme: theme,
                  padding: const EdgeInsets.all(12),
                  textStyle: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: _fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*

@override
Widget build(BuildContext context) {
  String code = widget.detail.codeExample.toString();
  const theme = darculaTheme;

  final customTheme = {
    ...darculaTheme,
    'root': TextStyle(backgroundColor: Colors.grey[900]),
  };

  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 8, 1),
      child: Column(
        children: [
          // Barra de herramientas
          Container(
            color: const Color.fromARGB(66, 35, 35, 35),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Guía o ejemplo:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: _fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(CupertinoIcons.zoom_in),
                  onPressed: _increaseFontSize,
                  color: Colors.white,
                  iconSize: 20,
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.zoom_out),
                  onPressed: _decreaseFontSize,
                  color: Colors.white,
                  iconSize: 20,
                ),
              ],
            ),
          ),

          // Área del código con scroll funcional
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(12),
              child: HighlightView(
                code,
                language: 'dart',
                theme: customTheme,
                textStyle: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: _fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
*/