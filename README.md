# 🍽️ App Receitinhas

Aplicativo mobile de receitas desenvolvido em Flutter como projeto de aprendizado durante o 3º ano do curso de Sistemas de Informação na FIAP.

---

## 📱 Sobre o App

O App Receitinhas permite cadastrar, visualizar e gerenciar receitas culinárias de forma simples e intuitiva. O projeto foi construído do zero com foco em aprender os fundamentos do desenvolvimento mobile com Flutter.

---

## ✅ Funcionalidades

- Listagem de receitas com nome e dificuldade
- Tela de detalhes com ingredientes, modo de preparo, tempo e porções
- Cadastro de novas receitas com formulário completo
- Remoção de receitas da lista
- Validação de campos obrigatórios
- Tela de lista vazia com feedback visual

---

## 🚀 Funcionalidades em desenvolvimento

- [ ] Persistência de dados com SQLite
- [ ] Edição de receitas existentes
- [ ] Favoritar receitas
- [ ] Busca por nome
- [ ] Foto na receita

---

## 🛠️ Tecnologias utilizadas

- [Flutter](https://flutter.dev/) 3.41.6
- [Dart](https://dart.dev/) 3.11.4
- Android SDK 36

---

## 📂 Estrutura do projeto

```
lib/
├── main.dart                  # Ponto de entrada do app
├── models/
│   └── receita.dart           # Modelo de dados
├── screens/
│   ├── tela_inicial.dart      # Lista de receitas
│   ├── tela_detalhe.dart      # Detalhes da receita
│   └── tela_cadastro.dart     # Formulário de cadastro
└── widgets/                   # Componentes reutilizáveis (em breve)
```

---

## ▶️ Como rodar o projeto

**Pré-requisitos:**
- Flutter SDK 3.41.6 ou superior
- Android Studio com emulador configurado, ou dispositivo Android com depuração USB ativada

**Passos:**

```bash
# Clonar o repositório
git clone https://github.com/FredericoNakayama/AppReceitinhas.git

# Entrar na pasta do projeto
cd AppReceitinhas

# Instalar dependências
flutter pub get

# Rodar o app
flutter run
```

---

## 📚 Aprendizados

Este projeto foi desenvolvido de forma progressiva, aplicando os seguintes conceitos:

- `StatelessWidget` e `StatefulWidget`
- Gerenciamento de estado com `setState`
- Navegação entre telas com `Navigator`
- Formulários com `TextEditingController`
- Listas dinâmicas com `ListView.builder`
- Classe modelo para estruturar dados
- Separação de responsabilidades em pastas

---

## 👨‍💻 Autor

Desenvolvido por **Frederico Nakayama**  
Estudante de Sistemas de Informação — FIAP
