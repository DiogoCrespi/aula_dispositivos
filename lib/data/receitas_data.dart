import '../models/receita.dart';

final List<Receita> receitas = [
  Receita(
    titulo: 'Bolo de Chocolate',
    descricao: 'Um delicioso bolo de chocolate com cobertura cremosa...',
    imagemUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?fit=crop&w=800&h=400',
    receitaCompleta: '''
      Ingredientes:
      - 2 xícaras de farinha
      - 1 xícara de chocolate em pó
      - 2 xícaras de açúcar
      - 3 ovos
      - 1 xícara de leite
      - 1/2 xícara de óleo
      - 1 colher de sopa de fermento

      Modo de Preparo:
      1. Pré-aqueça o forno a 180°C
      2. Misture os ingredientes secos
      3. Adicione os ingredientes líquidos
      4. Asse por 40 minutos
    ''',
  ),
  Receita(
    titulo: 'Pão de Queijo',
    descricao: 'Pão de queijo mineiro tradicional, macio e saboroso...',
    imagemUrl: 'https://images.unsplash.com/photo-1559141680-d0bd7bc5af84?fit=crop&w=900&h=500',
    receitaCompleta: '''
      Ingredientes:
      - 500g de polvilho azedo
      - 1 xícara de leite
      - 1/2 xícara de óleo
      - 2 ovos
      - 200g de queijo minas curado
      - Sal a gosto

      Modo de Preparo:
      1. Ferva o leite com o óleo
      2. Escalde o polvilho
      3. Adicione os ovos e o queijo
      4. Faça bolinhas e asse
    ''',
  ),
  Receita(
    titulo: 'Brigadeiro',
    descricao: 'O clássico doce brasileiro, cremoso e irresistível...',
    imagemUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?fit=crop&w=800&h=400',
    receitaCompleta: '''
      Ingredientes:
      - 1 lata de leite condensado
      - 3 colheres de sopa de chocolate em pó
      - 1 colher de sopa de manteiga
      - Chocolate granulado para decorar

      Modo de Preparo:
      1. Misture o leite condensado, chocolate e manteiga
      2. Leve ao fogo baixo, mexendo sempre
      3. Quando desgrudar do fundo da panela, está pronto
      4. Deixe esfriar e faça as bolinhas
    ''',
  ),
  Receita(
    titulo: 'Coxinha',
    descricao: 'Salgadinho crocante com recheio cremoso de frango...',
    imagemUrl: 'https://images.unsplash.com/photo-1617093727343-374698b1b08d?fit=crop&w=800&h=400',
    receitaCompleta: '''
      Ingredientes:
      - 4 xícaras de farinha de trigo
      - 2 xícaras de água
      - 2 tabletes de caldo de galinha
      - 2 colheres de sopa de manteiga
      - Recheio de frango desfiado
      - Farinha de rosca para empanar

      Modo de Preparo:
      1. Prepare o recheio de frango
      2. Faça a massa com água, caldo e manteiga
      3. Modele as coxinhas
      4. Empanar e fritar
    ''',
  ),
]; 