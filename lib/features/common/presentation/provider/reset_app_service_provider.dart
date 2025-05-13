import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/common/domain/data/services/reset_app_service_impl.dart';
import 'package:rutacode/features/common/domain/services/reset_app_service.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

final resetServiceProvider = Provider<ResetService>((ref) {
  return ResetServiceImpl(
    progressRepository: ref.read(progressRepositoryProvider),
    sharedPreferences: ref.read(sharedPreferencesProvider),
    ref: ref,
  );
});
