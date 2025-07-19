# 🚀 Brasil Cripto App

<div align="center">
  <img src="assets/logo.png" alt="Brasil Cripto Logo" width="100" height="100">
  
  **Seu companheiro definitivo para acompanhar o mercado de criptomoedas!**
  
  [![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
  [![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com)
  [![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
</div>

## 📱 Download do App

**[📲 Baixar APK](https://github.com/israel-oliveira/app-brasil-cripto/raw/main/apk/app-release.apk)**

## ✨ Funcionalidades

- 📊 **Cotações em Tempo Real** - Acompanhe os preços das principais criptomoedas
- ⭐ **Sistema de Favoritos** - Salve suas moedas preferidas para acesso rápido
- 📈 **Gráficos Interativos** - Visualize a evolução dos preços com gráficos detalhados
- 🔐 **Autenticação Segura** - Login e registro com Firebase Auth
- 💾 **Cache Inteligente** - Dados salvos localmente para acesso offline
- 🎨 **Interface Moderna** - Design limpo e intuitivo

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework multiplataforma
- **Firebase** - Autenticação e backend
- **CoinGecko API** - Dados de criptomoedas
- **SQLite** - Banco de dados local
- **MobX** - Gerenciamento de estado
- **Provider** - Injeção de dependências
- **FL Chart** - Gráficos interativos

## 🏗️ Arquitetura

O projeto segue os princípios de **Clean Architecture** com:

- **Domain Layer** - Modelos e regras de negócio
- **Data Layer** - Repositórios e fontes de dados
- **Presentation Layer** - UI e gerenciamento de estado
- **Dependency Injection** - Com Provider

## 🚀 Como Executar

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/israel-oliveira/app-brasil-cripto.git
   ```

2. **Instale as dependências:**

   ```bash
   flutter pub get
   ```

3. **Configure o Firebase:**

   - Adicione o arquivo `google-services.json` na pasta `android/app/`

4. **Execute o app:**
   ```bash
   flutter run
   ```

## 📦 Build

Para gerar o APK de produção:

```bash
flutter build apk --release
```

---

<div align="center">
  
**Desenvolvido com ❤️ por [Israel Oliveira](https://github.com/israel-oliveira)**

</div>
