// Necesitarás crear este provider para controlar el índice de la página
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressScorePageIndexProvider = StateProvider<int>((ref) => 0);
