# IR - Ações !

![Image of Stock Market](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/pexels-rodnae-productions-7947707(2).png)

Calculadora de Imposto de Renda para Ações com preço médio em Ruby !

Para melhorar o conhecimento de programação e ajudar no pagamento das contas para o leão.

================INSTRUÇÕES DE USO ====================

​		1- Instalar o Ruby para Windows ou linux

​		2- rodar o programa no terminal 

​		3- ruby acoes.rb

================XXXXXXXXXXXXXXXXX=====================

|                        Telas Iniciais                        |                        Telas Iniciais                        |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| ![Imagem tela de abertura](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/telaAberturaOpcao1.png) | ![Imagem Opção 1](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/Opcao1Selecionada.png) |
| ![Imagem Opção 2](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/Opcao2Selecionada.png) | ![Imagem Opção 3](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/Opcao3Selecionada.png) |
| ![Imagem Opção 4](https://github.com/adalbertobrant/IRAcoes/blob/main/imagens/Opcao4Selecionada.png) |                                                              |

========================FEATURES NECESSÁRIAS ===========

1- CALCULAR O DARF - 15% SOBRE VENDA DE AÇÕES

2- GRAVAR OS DADOS ENTRADOS NO DB (SQLITE pois é pequeno e o programa vai ser rodado localmente)

3 - SALVAR A PLANILHA EM CSV E CRIAR GRÁFICO VALOR X TEMPO

4-  Sugestões de features 

5- PEGAR A COTAÇÃO DO ATIVO PARA CALCULAR O DARF VIA INTERNET.

6- Usar hexapdf para lib  => https://hexapdf.gettalong.org/documentation/tutorials/modifying-a-pdf-document.html



======================== GERANDO IMAGEM DOCKER ===========

``
docker build . -t acoes:1.0.0
``


======================== EXECUTANDO IMAGEM DOCKER ===========

``
docker run -it --volume=./dados:/usr/src/app/dados acoes:1.0.0
``
