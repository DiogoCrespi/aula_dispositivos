# Lista Expansível com Animações em Flutter

Este projeto implementa uma lista interativa com animações implícitas em Flutter, demonstrando boas práticas de desenvolvimento e animações suaves para uma experiência de usuário moderna.

## 🎯 Objetivo

O aplicativo apresenta uma lista de produtos com cards expansíveis que utilizam animações implícitas do Flutter para criar transições suaves. Cada item da lista pode ser expandido/recolhido com uma animação fluida, revelando detalhes adicionais como descrição e opções de compra.

### Características Principais:
- Animações implícitas suaves usando `AnimatedContainer`
- Tema dinâmico (claro/escuro) com persistência
- Cache de imagens para melhor performance
- Interface responsiva e moderna
- Gerenciamento de estado com Provider

## 🚀 Instalação

1. **Pré-requisitos**
   - Flutter SDK (versão ^3.7.2)
   - Dart SDK (última versão estável)
   - Um editor de código (VS Code, Android Studio, etc.)

2. **Clone o repositório**
   ```bash
   git clone [url-do-repositorio]
   cd aula_dispositivos
   ```

3. **Instale as dependências**
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo**
   ```bash
   flutter run
   ```

## 📱 Como Usar

1. **Lista de Produtos**
   - Toque em qualquer item da lista para expandir/recolher
   - A animação suave revela detalhes adicionais do produto
   - O botão "Adicionar ao Carrinho" fica disponível quando expandido

2. **Tema**
   - Toque no ícone de tema no AppBar para alternar entre modo claro/escuro
   - A preferência de tema é salva automaticamente

3. **Carrinho**
   - Os produtos selecionados são adicionados ao carrinho
   - O contador no AppBar mostra a quantidade de itens

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework UI
- **Provider**: Gerenciamento de Estado
- **cached_network_image**: Cache de imagens
- **shared_preferences**: Persistência de dados
- **google_fonts**: Fontes personalizadas
- **lottie**: Animações complexas

## 📂 Estrutura do Projeto

```
lib/
├── animations/
│   └── pulse_animation.dart
├── models/
│   └── product.dart
├── providers/
│   └── cart_provider.dart
├── screens/
│   └── home_screen.dart
├── theme/
│   └── app_theme.dart
├── widgets/
│   ├── expandable_item.dart
│   ├── cart_item.dart
│   └── loading_widget.dart
└── main.dart
```

## 🎨 Screenshots

[Adicionar screenshots do aplicativo aqui]

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🤝 Contribuição

Contribuições são bem-vindas! Por favor, leia as [diretrizes de contribuição](CONTRIBUTING.md) antes de enviar um pull request.
