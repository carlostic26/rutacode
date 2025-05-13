import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class ImageLoadingWrapper extends StatefulWidget {
  final String imageUrl;

  const ImageLoadingWrapper({super.key, required this.imageUrl});

  @override
  State<ImageLoadingWrapper> createState() => _ImageLoadingWrapperState();
}

class _ImageLoadingWrapperState extends State<ImageLoadingWrapper> {
  late final Future<bool> _imageCheck;

  @override
  void initState() {
    super.initState();
    _imageCheck = _checkImageAvailability();
  }

  Future<bool> _checkImageAvailability() async {
    try {
      final response = await http.head(Uri.parse(widget.imageUrl));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _imageCheck,
      builder: (context, snapshot) {
        // Widget de carga animado
        if (!snapshot.hasData) {
          return _buildLoadingAnimation();
        }

        if (snapshot.data == true) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: AspectRatio(
              aspectRatio: 2.35 / 1,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) {
                  return progress == null ? child : _buildLoadingAnimation();
                },
                errorBuilder: (_, error, stack) {
                  return _buildErrorPlaceholder();
                },
              ),
            ),
          );
        }

        return _buildErrorPlaceholder();
      },
    );
  }

  Widget _buildLoadingAnimation() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 2.35 / 1,
        child: Stack(children: [
          Container(
            color: const Color.fromARGB(37, 255, 255, 255),
          ),
          Center(
            child: Lottie.asset(
              'assets/animations/loading_animation.json',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 2.35 / 1,
        child: Center(
          child: Lottie.asset(
            'assets/animations/loading_animation.json',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
