import 'package:flutter/material.dart';
import 'package:rede_social_app/data/frases.dart';
import 'package:rede_social_app/pages/post_header_widget.dart';
import 'package:rede_social_app/widgets/image_network_widget.dart';
import 'package:rede_social_app/widgets/storie_cicle_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false, // Título alinhado à esquerda
        title: const Text(
          'Rede Social - Mateus Dev',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily:
                'Billabong', // opcional, para imitar a fonte do Instagram
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
            icon: const Icon(Icons.send_outlined, color: Colors.black),
          ),
          const SizedBox(width: 8), // Espaçamento lateral direito
        ],
      ),

      body: Column(
        children: [
          // ---------- STORIES ----------
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return StorieCircleWidget(
                  imageUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
                  userName: 'User ${index + 1}',
                );
              },
            ),
          ),
          const Divider(height: 1),

          // ---------- FEED ----------
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho do post
                    PostHeaderWidget(
                      imageUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
                      userName: 'User ${index + 1}',
                      location: 'Localização',
                      onMore: () {},
                    ),

                    // Imagem do post
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: ImageNetworkWidget(
                        url:
                            'https://picsum.photos/500/300?random=${index + 1}',
                      ),
                    ),

                    // Ações
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.favorite_border, size: 25),
                          SizedBox(width: 16),
                          Icon(Icons.comment_outlined, size: 25),
                          SizedBox(width: 16),
                          Icon(Icons.send_outlined, size: 25),
                          Spacer(),
                          Icon(Icons.bookmark_border, size: 25),
                        ],
                      ),
                    ),

                    // Curtidas e legenda
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Text(
                        'Curtido por user123 e outras pessoas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        FrasesUtil.getFraseAleatoria(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
