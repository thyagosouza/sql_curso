// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
//? CRIAR CLASSE ESPELHANDO TABELA NO MODELO RELACIONAL

import 'package:equatable/equatable.dart';

class ProdutoEntity extends Equatable {
  //? VALOR INTEIRO DO ID SERÁ CRIADO PELA BASE DE DADOS
  late int? produtoID;
  final String nome;
  final String descricao;
  final double valor;
  ProdutoEntity({
    this.produtoID,
    required this.nome,
    required this.descricao,
    required this.valor,
  });

  @override
  //? QUAL PROPRIEDADE SERÁ RESPONSÁVEL PELA INDENTIDADE DO OBJETO
  //? A ENTITADE PODE SER COMPOSTA POR VÁRIAS PROPRIEDADES
  List<Object?> get props => [produtoID];
}
