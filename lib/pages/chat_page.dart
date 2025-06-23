import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> chats = [
    {
      'nome': 'Ana Tech',
      'mensagem': 'Belo aplicativo!',
      'foto': 'https://randomuser.me/api/portraits/women/1.jpg',
      'ativo': true,
    },
    {
      'nome': 'João Code',
      'mensagem': 'Check-in no projeto ✔️',
      'foto': 'https://randomuser.me/api/portraits/men/2.jpg',
      'ativo': false,
    },
    {
      'nome': 'Carlos Front',
      'mensagem': 'Me envia aquele layout',
      'foto': 'https://randomuser.me/api/portraits/men/4.jpg',
      'ativo': true,
    },
    {
      'nome': 'Larissa Mobile',
      'mensagem': 'Você viu a atualização do Flutter?',
      'foto': 'https://randomuser.me/api/portraits/women/13.jpg',
      'ativo': true,
    },
    {
      'nome': 'Gabriel Fullstack',
      'mensagem': 'Fechou o deploy 🚀',
      'foto': 'https://randomuser.me/api/portraits/men/8.jpg',
      'ativo': false,
    },
    {
      'nome': 'Fernanda UX',
      'mensagem': 'Precisamos discutir aquele feedback.',
      'foto': 'https://randomuser.me/api/portraits/women/9.jpg',
      'ativo': false,
    },
  ];

  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered =
        chats
            .where(
              (user) =>
                  user['nome'].toLowerCase().contains(search.toLowerCase()),
            )
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        title: const Text(
          'mateusphb.dev',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline, color: Colors.black, size: 25),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // ---------- Campo de busca ----------
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),

          // ---------- Lista de chats ----------
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder:
                  (context, index) => const Divider(height: 1, thickness: 0.4),
              itemBuilder: (context, index) {
                final user = filtered[index];

                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user['foto']),
                        radius: 26,
                      ),
                      if (user['ativo'])
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    user['nome'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    user['mensagem'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    // Aqui pode abrir o chat individual futuramente
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
