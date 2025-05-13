import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/common/presentation/provider/reset_app_service_provider.dart';

class DeleteProgressWidget extends ConsumerStatefulWidget {
  const DeleteProgressWidget({super.key});

  @override
  ConsumerState<DeleteProgressWidget> createState() =>
      _DeleteProgressWidgetState();
}

class _DeleteProgressWidgetState extends ConsumerState<DeleteProgressWidget> {
  bool _isLoading = false;

  Future<void> _deleteProgress() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(resetServiceProvider).resetAllUserProgress();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Progreso borrado exitosamente')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Borrar Progreso'),
      content: const Text(
        '¿Estás seguro de que quieres borrar todo tu progreso? '
        'Esto incluye todos los niveles completados, temas, subtemas y puntajes. '
        'Esta acción no se puede deshacer.',
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: _isLoading ? null : _deleteProgress,
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(
                  'Borrar',
                  style: TextStyle(color: Colors.red),
                ),
        ),
      ],
    );
  }
}
