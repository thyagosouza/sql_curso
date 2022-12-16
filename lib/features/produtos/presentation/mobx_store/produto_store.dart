import 'package:mobx/mobx.dart';

///* flutter packages pub run build_runner build
part 'produto_store.g.dart';

class ProdutoStore = _ProdutoStore with _$ProdutoStore;
//? CRIAR AS PROPRIEDADES QUE SERÃO OBSERVÁVEIS
//? QUE TERÃO SEU ESTADO OBSERVADO PELO MOBX
//? QUANDO HOUVER MUDANÇA DE ESTADO DA PROPRIEDADE, ELE SERÁ REBUILDADO

abstract class _ProdutoStore with Store {
  @observable
  String? _nome;

  @observable
  String? _descricao;

  @observable
  double? _valor;

  @computed
  String get nome => _nome ?? '';
  @computed
  String get descricao => _descricao ?? '';
  @computed
  double get valor => _valor ?? 0;

  @action
  atualizarNome({required String nome}) {
    _nome = nome;
  }

  @action
  atualizarDescricao(String descricao) {
    _descricao = descricao;
  }

  @action
  atualizarValor(String valor) {
    _valor = double.tryParse(valor);
  }
}
