import 'package:flutter/material.dart';
import 'package:rede_social_app/widgets/seguidor_tile_widget.dart';

class SeguidoresPage extends StatefulWidget {
  const SeguidoresPage({super.key});

  @override
  State<SeguidoresPage> createState() => _SeguidoresPageState();
}

class _SeguidoresPageState extends State<SeguidoresPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> seguidores = [
    {
      'nome': 'Mateus Dev',
      'username': '@mateus.dev',
      'foto': 'https://avatars.githubusercontent.com/u/583231?v=4',
      'seguindo': true,
    },
    {
      'nome': 'Ana Tech',
      'username': '@ana.tech',
      'foto': 'https://randomuser.me/api/portraits/women/1.jpg',
      'seguindo': false,
    },
    {
      'nome': 'João Code',
      'username': '@joaocode',
      'foto': 'https://randomuser.me/api/portraits/men/2.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Dev Designer',
      'username': '@devdesign',
      'foto': 'https://randomuser.me/api/portraits/women/3.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Carlos Front',
      'username': '@carlos.front',
      'foto': 'https://randomuser.me/api/portraits/men/4.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Maria UI',
      'username': '@maria.ui',
      'foto': 'https://randomuser.me/api/portraits/women/5.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Lucas Flutter',
      'username': '@lucas.flutter',
      'foto': 'https://randomuser.me/api/portraits/men/6.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Patrícia Backend',
      'username': '@pat.backend',
      'foto': 'https://randomuser.me/api/portraits/women/7.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Gabriel Fullstack',
      'username': '@gabriel.full',
      'foto': 'https://randomuser.me/api/portraits/men/8.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Fernanda UX',
      'username': '@fernanda.ux',
      'foto': 'https://randomuser.me/api/portraits/women/9.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Rafael Cloud',
      'username': '@rafa.cloud',
      'foto': 'https://randomuser.me/api/portraits/men/10.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Juliana AI',
      'username': '@juliana.ai',
      'foto': 'https://randomuser.me/api/portraits/women/11.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Pedro Front',
      'username': '@pedro.front',
      'foto': 'https://randomuser.me/api/portraits/men/12.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Larissa Mobile',
      'username': '@larissa.mobile',
      'foto': 'https://randomuser.me/api/portraits/women/13.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Thiago API',
      'username': '@thiago.api',
      'foto': 'https://randomuser.me/api/portraits/men/14.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Sofia DevOps',
      'username': '@sofia.devops',
      'foto': 'https://randomuser.me/api/portraits/women/15.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Bruno JS',
      'username': '@bruno.js',
      'foto': 'https://randomuser.me/api/portraits/men/16.jpg',
      'seguindo': false,
    },
    {
      'nome': 'Isabela Python',
      'username': '@isabela.py',
      'foto': 'https://randomuser.me/api/portraits/women/17.jpg',
      'seguindo': true,
    },
    {
      'nome': 'André SQL',
      'username': '@andre.sql',
      'foto': 'https://randomuser.me/api/portraits/men/18.jpg',
      'seguindo': true,
    },
    {
      'nome': 'Camila NoCode',
      'username': '@camila.nocode',
      'foto': 'https://randomuser.me/api/portraits/women/19.jpg',
      'seguindo': false,
    },
  ];

  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered =
        seguidores
            .where(
              (user) =>
                  user['nome'].toLowerCase().contains(search.toLowerCase()) ||
                  user['username'].toLowerCase().contains(search.toLowerCase()),
            )
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seguidores',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
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

          // ---------- Lista de seguidores ----------
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final user = filtered[index];

                return SeguidorTileWidget(
                  nome: user['nome'],
                  username: user['username'],
                  fotoUrl: user['foto'],
                  seguindo: user['seguindo'],
                  onTap: () {
                    setState(() {
                      user['seguindo'] = !user['seguindo'];
                    });
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
