import 'dart:math';

class FrasesUtil {
  static final List<String> frasesAleatorias = [
    'A vida é agora.',
    'Sorria, você está vivendo.',
    'Cada dia é um recomeço.',
    'Simplicidade é tudo.',
    'Seja luz.',
    'Confie no processo.',
    'Tudo tem seu tempo.',
    'Respira e vai.',
    'Viva o que te faz bem.',
    'Colecione momentos.',
    'Menos expectativa, mais realidade.',
    'Gratidão transforma.',
    'Seja a sua melhor versão.',
    'Deixa fluir.',
    'Foque no que importa.',
    'O mundo é dos que acreditam.',
    'Vibração boa atrai coisa boa.',
    'Segue o fluxo.',
    'Tudo passa.',
    'O impossível é só questão de opinião.',
  ];

  static String getFraseAleatoria() {
    final random = Random();
    return frasesAleatorias[random.nextInt(frasesAleatorias.length)];
  }
}
