# Desafio Calculadora de IMC em Dart

Aplicação de linha de comando (CLI) desenvolvida em **Dart** para cálculo e classificação do **Índice de Massa Corporal (IMC)**, desenvolvida como parte dos desafios da formação da **DIO (Digital Innovation One)**.

O projeto foi construído seguindo boas práticas de desenvolvimento orientado a objetos, padrão de projeto **Strategy**, criação de exceções personalizadas e uma suíte completa de testes unitários com suporte a mocks.

---

## 📋 Sumário

- [Sobre a Calculadora de IMC](#-sobre-a-calculadora-de-imc)
  - [O que é IMC?](#o-que-é-imc)
  - [Fórmula de Cálculo](#fórmula-de-cálculo)
  - [Tabela de Classificação](#tabela-de-classificação)
- [✨ Funcionalidades e Características](#-funcionalidades-e-características)
- [🏛️ Arquitetura e Estrutura do Projeto](#️-arquitetura-e-estrutura-do-projeto)
- [🚀 Pré-requisitos](#-pré-requisitos)
- [📦 Como Instalar e Rodar](#-como-instalar-e-rodar)
  - [1. Clonar ou acessar a pasta](#1-clonar-ou-acessar-a-pasta)
  - [2. Instalar dependências](#2-instalar-dependências)
  - [3. Executar o projeto](#3-executar-o-projeto)
- [🖥️ Exemplos de Uso](#️-exemplos-de-uso)
  - [Fluxo de Sucesso](#fluxo-de-sucesso)
  - [Fluxo com Entrada Inválida (Exceção)](#fluxo-com-entrada-inválida-exceção)
- [🧪 Como Executar os Testes](#-como-executar-os-testes)
- [⚠️ Tratamento de Exceções](#️-tratamento-de-exceções)
- [🛠️ Tecnologias Utilizadas](#️-tecnologias-utilizadas)

---

## 🧮 Sobre a Calculadora de IMC

### O que é IMC?
O **Índice de Massa Corporal (IMC)** é uma métrica internacional adotada pela Organização Mundial da Saúde (OMS) para avaliar se uma pessoa está em seu peso ideal com base na sua altura.

### Fórmula de Cálculo
A fórmula matemática utilizada pelo método `calcularImc` é:

$$IMC = \frac{peso}{(altura)^2}$$

- **Peso:** em quilogramas (ex.: `70.0`)
- **Altura:** em metros (ex.: `1.75`)
- O cálculo é arredondado para **2 casas decimais** (`toStringAsFixed(2)`).

### Tabela de Classificação

O sistema utiliza a enumeração `ClassificacaoImcEnum` e o padrão `ImcStrategy` para classificar o IMC nos seguintes intervalos:

| Faixa de IMC | Classificação (`ClassificacaoImcEnum`) | Descrição Exibida |
| :--- | :--- | :--- |
| `< 16.0` | `MAGREZA_GRAVE` | Magreza Grave |
| `16.0` a `< 17.0` | `MAGREZA_MODERADA` | Magreza Moderada |
| `17.0` a `< 18.5` | `MAGREZA_LEVE` | Magreza Leve |
| `18.5` a `< 25.0` | `SAUDAVEL` | Saudável |
| `25.0` a `< 30.0` | `SOBREPESO` | Sobrepeso |
| `30.0` a `< 35.0` | `OBESIDADE_GRAU_I` | Obesidade grau I |
| `35.0` a `< 40.0` | `OBESIDADE_GRAU_II` | Obesidade grau II |
| `≥ 40.0` | `OBESIDADE_GRAU_III` | Obesidade grau III |

---

## ✨ Funcionalidades e Características

- **Interação via Terminal:** Leitura com suporte a codificação UTF-8 para nomes com acentos.
- **Normalização de Entrada Numérica:** O método `normalizarDouble` aceita números decimais tanto com vírgula (`1,75` ou `70,5`) quanto com ponto (`1.75` ou `70.5`).
- **Padrão Strategy:** A interface `ImcStrategy` e a classe `ImcPessoaStrategy` isolam a lógica de classificação por faixas de IMC, permitindo extensão de outras estratégias (como IMC para atletas ou idosos) sem modificar o serviço principal.
- **Tratamento Robusto de Exceções:** Lançamento de `InputException` para campos vazios ou formatos inválidos.
- **Testes com Mocks:** Cobertura de testes unitários utilizando o pacote `mocktail` para simular entradas de `stdin` e captura de saídas do console.

---

## 🏛️ Arquitetura e Estrutura do Projeto

A organização dos arquivos reflete a separação de responsabilidades do código:

```
dio-desafio-imc-dart/
├── bin/
│   └── dio_desafio_imc_dart.dart      # Ponto de entrada da aplicação (main)
├── lib/
│   ├── enums/
│   │   └── classificacao_imc_enum.dart # Enum com faixas e descrições do IMC
│   ├── exceptions/
│   │   └── input-exception.dart       # Exceção personalizada (InputException)
│   ├── models/
│   │   └── pessoa.dart                # Modelo de dados Pessoa (nome, peso, altura)
│   ├── patterns/
│   │   └── imc-strategy.dart          # Strategy pattern para regras de classificação
│   └── services/
│       └── imc-service.dart           # Serviço de captura, normalização e cálculo
├── test/
│   └── dio_desafio_imc_dart_test.dart # Testes automatizados (cálculo, mocks e validações)
├── analysis_options.yaml              # Regras de linter
├── pubspec.yaml                       # Metadados e dependências do projeto
└── README.md                          # Documentação do projeto
```

---

## 🚀 Pré-requisitos

Para executar este projeto, você precisará ter instalado em sua máquina:

- **Dart SDK** (versão `^3.7.0` ou superior).
- Verifique a versão instalada executando no terminal:
  ```bash
  dart --version
  ```

---

## 📦 Como Instalar e Rodar

### 1. Clonar ou acessar a pasta
Abra o terminal e acerte o diretório do projeto:

```bash
cd dio-desafio-imc-dart
```

### 2. Instalar dependências
Baixe os pacotes necessários especificados no `pubspec.yaml`:

```bash
dart pub get
```

### 3. Executar o projeto
Para iniciar a aplicação interativa via terminal:

```bash
dart run
```

*(Ou alternativamente, indicando o arquivo principal:)*
```bash
dart run bin/dio_desafio_imc_dart.dart
```

---

## 🖥️ Exemplos de Uso

### Fluxo de Sucesso

Ao rodar a aplicação, o terminal solicitará sequencialmente o nome, o peso e a altura:

```text
Digite seu nome:
Carlos Silva
Digite seu peso:
75,5
Digite sua altura:
1.75
Nome: Carlos Silva, Peso: 75.5, Altura: 1.75
IMC: 24.65
Classificação: Saudável
```

### Fluxo com Entrada Inválida (Exceção)

Se algum valor inválido for informado (por exemplo, letras no peso ou nome vazio), uma exceção `InputException` será lançada:

```text
Digite seu nome:
Ana
Digite seu peso:
abc
Unhandled exception:
InputException(message: Peso inválido!)
#0      ImcService.capturarEntrada (package:dio_desafio_imc_dart/services/imc-service.dart:30:7)
#1      main (package:dio_desafio_imc_dart/dio_desafio_imc_dart.dart:6:27)
```

---

## 🧪 Como Executar os Testes

O projeto conta com suíte de testes cobrindo cálculo, normalização, classificação e validação de inputs através de mocks de `stdin`.

Para rodar todos os testes automatizados:

```bash
dart test
```

Para rodar especificamente o arquivo de testes do projeto:

```bash
dart test test/dio_desafio_imc_dart_test.dart
```

Para ver a saída detalhada de cada teste durante a execução:

```bash
dart test --reporter expanded
```

---

## ⚠️ Tratamento de Exceções

O sistema implementa a classe `InputException` em `lib/exceptions/input-exception.dart` para sinalizar entradas inadequadas:

| Cenário de Entrada | Validação Realizada | Mensagem da Exceção |
| :--- | :--- | :--- |
| **Nome vazio ou com espaços** | `nome.trim() == ""` | `InputException(message: nome inválido!)` |
| **Peso não numérico ou zero** | `peso == null \|\| peso == 0.0` | `InputException(message: Peso inválido!)` |
| **Altura não numérica** | `altura == null` | `InputException(message: Altura inválida!)` |

---

## 🛠️ Tecnologias Utilizadas

- **[Dart](https://dart.dev/)**: Linguagem de programação principal.
- **[test](https://pub.dev/packages/test)**: Framework oficial para escrita e execução de testes em Dart.
- **[mocktail](https://pub.dev/packages/mocktail)**: Biblioteca de mock para Dart, utilizada para testar entradas de terminal (`stdin`).
- **[lints](https://pub.dev/packages/lints)**: Conjunto oficial de regras e boas práticas de análise estática de código Dart.
