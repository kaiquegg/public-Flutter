import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controllerValor = TextEditingController();
  final TextEditingController controllerPessoas = TextEditingController();
  // final TextEditingController controllerBebidas = TextEditingController();
  final TextEditingController controllerValorBebida = TextEditingController();

  final TextEditingController controllerPessoasBebida = TextEditingController();
  double valor = 0;
  int pessoas = 0;
  bool bebida = false;
  int pessoasBebidas = 0;
  double valorBebida = 0;
  double resul = 0;
  double resulB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 224, 138, 255),
      // backgroundColor é a cor do Scaffold (fundo);
      body: ListView(children: [
        Column(
          children: [
            //Padding serve para criar um afastamento
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                width: double.infinity,
                // width: double.infinity, define a largura infinita
                height: 100,
                // height: 100, define a altura com 100
                decoration: BoxDecoration(
                    // Serve para decorar o container
                    borderRadius: BorderRadius.circular(20),
                    //cria as bordas circulares
                    color: const Color.fromARGB(255, 224, 138, 255),
                    // define a cor do container
                    boxShadow: const [
                      //serve para criar a sombra no container
                      BoxShadow(
                        spreadRadius: 3,
                        //spreadRadius: 3, define o tamanho da sombra
                        blurRadius: 7,
                        //blurRadius: 7, define o tamanho do degradê
                        offset: Offset(3, 7),
                        // offset: Offset(3, 7), define a posição da sombra
                        color: Colors.black26,
                        // color: Colors.black26, define a cor da sombra
                      ),
                    ]),
                child: Column(
                  // Coluna filha do container
                  children: [
                    const Padding(
                      // cria um afatamento da linha onde esta o texto e o icone
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //MainAxisAlignment.spaceBetween, separa os itens nas extremidades
                        children: [
                          Text(
                            "Qual o valor do rolê ?",
                            style: TextStyle(
                                // define o estilo do texto
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400),
                          ),
                          Text("💰 💸")
                        ],
                      ),
                    ),
                    Padding(
                      //cria o afastamento do campo onde o usuário digita uma informação
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 .]')),
                        ],
                        onSubmitted: (value) {
                          setState(() {
                            valor = double.tryParse(value) ?? 0;
                            if (valor <= 0) {
                              print("O valor informado é invalido");
                            } else {
                              print("O valor informado é $valor");
                            }
                          });
                          resultadoFinal();
                        },
                        controller: controllerValor,
                        //campo onde o usuário digita uma informação
                        decoration: InputDecoration(
                          // decoração do campo onde o usuário digita uma informação
                          icon: IconButton(
                            //icone antes do campo com função de botão
                            onPressed: () {
                              valor =
                                  double.tryParse(controllerValor.text) ?? 0;
                              if (valor <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $valor");
                              }

                              resultadoFinal();
                            },
                            //função vazia, todo botão precisa de uma função
                            //quando for pressionado
                            icon: const Icon(
                              Icons.monetization_on,
                              size: 40,
                            ),
                          ),
                          labelText: "valor",
                          // nome que mostra no campo
                          hintText: "Ex.: 234.50",
                          //exemplo para o usuário fazer
                          enabledBorder: OutlineInputBorder(
                            //habilita a borda externa do campo
                            borderRadius: BorderRadius.circular(15),
                            // deixa a borda aredondada
                            borderSide:
                                const BorderSide(color: Colors.yellow),
                            // para estilizar a borda
                          ),
                          focusedBorder: OutlineInputBorder(
                              //habilita a borda quando clicar no campo
                              borderRadius: BorderRadius.circular(15),
                              // deixa a borda aredondada
                              borderSide:
                                  const BorderSide(color: Colors.yellow)),
                          // para estilizar a borda
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //quantidade de pessoas
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Text(
                            "Quantidade total de pessoas?",
                            style: TextStyle(
                                // define o estilo do texto
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //cria o afastamento do campo onde o usuário digita uma informação
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onSubmitted: (value) {
                          setState(() {
                            pessoas = int.tryParse(value) ?? 0;
                            if (pessoas <= 0) {
                              print("O valor informado é invalido");
                            } else {
                              print("O valor informado é $pessoas");
                            }
                          });
                          resultadoFinal();
                        },
                        controller: controllerPessoas,
                        //campo onde o usuário digita uma informação
                        decoration: InputDecoration(
                          // decoração do campo onde o usuário digita uma informação
                          icon: IconButton(
                            //icone antes do campo com função de botão
                            onPressed: () {
                              pessoas =
                                  int.tryParse(controllerPessoas.text) ?? 0;
                              if (pessoas <= 0) {
                                print(
                                    "o numero de pessoas informado é invalido");
                              } else {
                                print("A quantidade de pessoas é $pessoas");
                              }
                              resultadoFinal();
                            },
                            //função vazia, todo botão precisa de uma função
                            //quando for pressionado
                            icon: const Icon(
                              Icons.emoji_people_sharp,
                              size: 40,
                            ),
                          ),
                          labelText: "pessoas",
                          // nome que mostra no campo
                          hintText: "Ex.: 4",
                          //exemplo para o usuário fazer
                          enabledBorder: OutlineInputBorder(
                            //habilita a borda externa do campo
                            borderRadius: BorderRadius.circular(15),
                            // deixa a borda aredondada
                            borderSide:
                                const BorderSide(color: Colors.purpleAccent),
                            // para estilizar a borda
                          ),
                          focusedBorder: OutlineInputBorder(
                              //habilita a borda quando clicar no campo
                              borderRadius: BorderRadius.circular(15),
                              // deixa a borda aredondada
                              borderSide:
                                  const BorderSide(color: Colors.purple)),
                          // para estilizar a borda
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //se teve ou não bebida alcoolica
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Teve bebida alcoólica",
                        style: TextStyle(
                            // define o estilo do texto
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                      Switch(
                          value: bebida,
                          onChanged: (value) {
                            setState(() {
                              bebida = value;
                              if (bebida) {
                                resulB = 0;
                                print("Teve bebida");
                              } else {
                                print("Não teve");
                              }
                              resultadoFinal();
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            //quantas pessoas beberam
            Visibility(
              visible: bebida,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 138, 255),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(3, 7),
                            color: Colors.black26)
                      ]),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          children: [
                            Text(
                              "Quantas pessoas beberam?",
                              style: TextStyle(
                                  // define o estilo do texto
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        //cria o afastamento do campo onde o usuário digita uma informação
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onSubmitted: (value) {
                            setState(() {
                              pessoasBebidas = int.tryParse(value) ?? 0;
                              if (pessoasBebidas <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $pessoasBebidas");
                              }
                            });
                            resultadoFinal();
                          },
                          controller: controllerPessoasBebida,
                          //campo onde o usuário digita uma informação
                          decoration: InputDecoration(
                            // decoração do campo onde o usuário digita uma informação
                            icon: IconButton(
                              //icone antes do campo com função de botão
                              onPressed: () {
                                pessoasBebidas = int.tryParse(
                                        controllerPessoasBebida.text) ??
                                    0;
                                if (pessoasBebidas <= 0) {
                                  print(
                                      "o numero de pessoas informado é invalido");
                                } else {
                                  print(
                                      "A quantidade de pessoas que beberam são $pessoasBebidas");
                                }

                                resultadoFinal();
                              },
                              //quando for pressionado
                              icon: const Icon(
                                Icons.emoji_people_sharp,
                                size: 40,
                              ),
                            ),
                            labelText: "pessoas",
                            // nome que mostra no campo
                            hintText: "Ex.: 4",
                            //exemplo para o usuário fazer
                            enabledBorder: OutlineInputBorder(
                              //habilita a borda externa do campo
                              borderRadius: BorderRadius.circular(15),
                              // deixa a borda aredondada
                              borderSide:
                                  const BorderSide(color: Colors.purpleAccent),
                              // para estilizar a borda
                            ),
                            focusedBorder: OutlineInputBorder(
                                //habilita a borda quando clicar no campo
                                borderRadius: BorderRadius.circular(15),
                                // deixa a borda aredondada
                                borderSide:
                                    const BorderSide(color: Colors.purple)),
                            // para estilizar a borda
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bebida,
              child: Padding(
                //Padding serve para criar um afastamento
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  // width: double.infinity, define a largura infinita
                  height: 100,
                  // height: 100, define a altura com 100
                  decoration: BoxDecoration(
                      // Serve para decorar o container
                      borderRadius: BorderRadius.circular(20),
                      //cria as bordas circulares
                      color: const Color.fromARGB(255, 224, 138, 255),
                      // define a cor do container
                      boxShadow: const [
                        //serve para criar a sombra no container
                        BoxShadow(
                          spreadRadius: 3,
                          //spreadRadius: 3, define o tamanho da sombra
                          blurRadius: 7,
                          //blurRadius: 7, define o tamanho do degradê
                          offset: Offset(3, 7),
                          // offset: Offset(3, 7), define a posição da sombra
                          color: Colors.black26,
                          // color: Colors.black26, define a cor da sombra
                        ),
                      ]),
                  child: Column(
                    // Coluna filha do container
                    children: [
                      const Padding(
                        // cria um afatamento da linha onde esta o texto e o icone
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //MainAxisAlignment.spaceBetween, separa os itens nas extremidades
                          children: [
                            Text(
                              "Qual o valor da bebida ?",
                              style: TextStyle(
                                  // define o estilo do texto
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("💰 💸")
                          ],
                        ),
                      ),
                      Padding(
                        //cria o afastamento do campo onde o usuário digita uma informação
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              valorBebida = double.tryParse(value) ?? 0;
                              if (valorBebida <= 0) {
                                print("O valor informado é invalido");
                              } else {
                                print("O valor informado é $valorBebida");
                              }
                            });
                            resultadoFinal();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9 .]')),
                          ],
                          controller: controllerValorBebida,
                          //campo onde o usuário digita uma informação
                          decoration: InputDecoration(
                            // decoração do campo onde o usuário digita uma informação
                            icon: IconButton(
                              //icone antes do campo com função de botão
                              onPressed: () {
                                valorBebida = double.tryParse(
                                        controllerValorBebida.text) ??
                                    0;
                                if (valorBebida <= 0) {
                                  print("O valor informado é invalido");
                                } else {
                                  print("O valor da bebida é $valorBebida");
                                }
                                resultadoFinal();
                                print("o resultado é $resulB");
                              },
                              //função vazia, todo botão precisa de uma função
                              //quando for pressionado
                              icon: const Icon(
                                Icons.monetization_on,
                                size: 40,
                              ),
                            ),
                            labelText: "valor",
                            // nome que mostra no campo
                            hintText: "Ex.: 234.50",
                            //exemplo para o usuário fazer
                            enabledBorder: OutlineInputBorder(
                              //habilita a borda externa do campo
                              borderRadius: BorderRadius.circular(15),
                              // deixa a borda aredondada
                              borderSide:
                                  const BorderSide(color: Colors.purpleAccent),
                              // para estilizar a borda
                            ),
                            focusedBorder: OutlineInputBorder(
                                //habilita a borda quando clicar no campo
                                borderRadius: BorderRadius.circular(15),
                                // deixa a borda aredondada
                                borderSide:
                                    const BorderSide(color: Colors.purple)),
                            // para estilizar a borda
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 138, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 7),
                          color: Colors.black26)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Valor para quem bebeu: ${resulB.toStringAsFixed(2)}",
                        style: const TextStyle(
                            // define o estilo do texto
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Valor para quem não bebeu: ${resul.toStringAsFixed(2)}",
                        style: const TextStyle(
                            // define o estilo do texto
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void resultadoFinal() {
    if (valor > 0 && pessoas > 0) {
      setState(() {
        resul = valor / pessoas;
        if (bebida && valorBebida > 0 && pessoasBebidas > 0) {
          resulB = (valorBebida / pessoasBebidas) + (valor / pessoas);
        } else {
          resulB = 0;
        }
      });
      return;
    }

    if (valor == 0 && bebida && valorBebida > 0 && pessoasBebidas > 0) {
      setState(() {
        resulB = valorBebida / pessoasBebidas;
      });
    } else {
      setState(() {
        resul = 0;
        resulB = 0;
      });
    }
  }
}
