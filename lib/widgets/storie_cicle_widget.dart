import 'package:flutter/material.dart';

class StorieCircleWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final double radius;

  const StorieCircleWidget({
    super.key,
    required this.imageUrl,
    required this.userName,
    this.radius = 28, // tamanho padrão
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2.5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(imageUrl),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 30, color: Colors.grey);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
