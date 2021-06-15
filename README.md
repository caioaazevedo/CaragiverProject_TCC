# iCare - Caregiver
Trabalho de conclusão de curso (TCC) voltado aos familiares de portadores de Alzheimer. O projeto tem como objetivo unir, auxiliar e dividir a responsabilidade que é cuidar de um ente querido.

O aplicativo iCare é um gerenciador de famílias, que visa dividir tarefas e retirar a sobrecarga de ter que cuidar de uma pessoa dependente sozinho(a).

## Funcionalidades
### **Autenticação**

![](https://media.giphy.com/media/r7vvQXAdi8leKOkpwB/giphy.gif)

Permite cadastrar usuários e efetuar login de contas existentes. Os campos de entradas são validados e apresentam mensagens de error caso sejam preenchidos incorretamente.

### **Criar grupo**

![](https://media.giphy.com/media/bVY8yux0safPHDf3rR/giphy.gif)

Permite criar um grupo ou entrar em um grupo existente.

### **Árvore genealógica**

![](https://media.giphy.com/media/HMEI5jIzC2D0abbl8S/giphy.gif)

Mostra uma tela contendo uma árvore genealógica com todos os membros do grupo e suas relações com o familiar portador de Alzheimer. Também é possível convidar novos membros do grupo compartilhando um token em outro aplicativo (como WhatsApp).

### **Calendário**

![](https://media.giphy.com/media/3b3JAQtJ1B6EMjlwlh/giphy.gif) ![](https://media.giphy.com/media/leRqJxTYfB3jxpU7aF/giphy.gif)

Mostra um calendário com eventos em relação a data. Permite gerenciá-los e consultar os detalhes. Permite delegar o evento à outro membro do grupo.

### **Profile**

![](https://media.giphy.com/media/99iUdDQCEo1Tdh7H3I/giphy.gif)

Permite consultar e gerenciar as informações e a rotina do familiar portador de Alzheimer.

## Requerimentos
* iOS 14.0+
* Xcode 12.1

## Tecnologias usadas

* **Linguagem:** Swift.
* **IDE(Integrated Development Environment):** Xcode.
* **Arquitetura:** MVVM-C.
* **Back-end:** Firebase.
* **Outros:** Combine; View code; UIKit.

## Como usar
### TestFlight
* Baixe o applicativo *TestFlight* na *App Store*.
* Entre no link https://testflight.apple.com/join/CYRRVhQO

### Clonar o repositório:
* Abra o terminal e selecione a pasta onde deseja colocar o repositório com o comando ```cd NOME_DA_PASTA```.
* Use o comando ``` git clone https://github.com/caioaazevedo/CaragiverProject_TCC.git ``` para clonar o repositório do projeto.
* Entre na pasta criada pelo terminal e use o comando ```pod install``` para installar as dependencias.
* Abra o arquivo *CaregiverProject.xcworkspace* e execute o projeto no *Xcode*.

### Conta teste
* E-mail: jhon@gmail.com
* Password: 123123123
* Chave do grupo: C451E5D7-C887-4FE7-8D52-EB280EC8D834
