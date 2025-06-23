import 'package:flutter/material.dart';
import 'package:rede_social_app/widgets/image_network_widget.dart';

class PostHeaderWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String location;
  final VoidCallback? onMore;

  const PostHeaderWidget({
    super.key,
    required this.imageUrl,
    required this.userName,
    this.location = 'Localização',
    this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 24,
        child: ImageNetworkWidget(
          url: imageUrl,
          width: 48,
          height: 48,
          radius: 48,
        ),
      ),
      title: Text(
        userName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        location,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: onMore,
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
