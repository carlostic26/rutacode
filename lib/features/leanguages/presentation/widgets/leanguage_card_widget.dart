import 'package:flutter/material.dart';

class LeanguageCardWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const LeanguageCardWidget({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 100,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit
                        .contain, // La imagen se ajusta manteniendo su relación de aspecto
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
