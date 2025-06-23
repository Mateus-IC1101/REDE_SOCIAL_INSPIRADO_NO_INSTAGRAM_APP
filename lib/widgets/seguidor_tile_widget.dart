import 'package:flutter/material.dart';

class SeguidorTileWidget extends StatelessWidget {
  final String nome;
  final String username;
  final String fotoUrl;
  final bool seguindo;
  final VoidCallback onTap;

  const SeguidorTileWidget({
    super.key,
    required this.nome,
    required this.username,
    required this.fotoUrl,
    required this.seguindo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(fotoUrl), radius: 24),
      title: Text(nome, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        username,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      trailing: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: seguindo ? Colors.grey[200] : Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          seguindo ? 'Mensagem' : 'Seguir de Volta',
          style: TextStyle(
            fontSize: 12,
            color: seguindo ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
