import 'package:mobx/mobx.dart';
import 'package:teste_vaga/models/model_produto/model_produto.dart';

part 'produtos_state.g.dart';

class ProdutosState = _ProdutosState with _$ProdutosState;

abstract class _ProdutosState with Store {
  @observable
  List<ModelProduto> _listaProdutos = ObservableList();

  @observable
  bool _loading = false;

  @observable
  bool _hasError = false;

  @computed
  List<ModelProduto> get listaProdutos => _listaProdutos;

  @computed
  bool get loading => _loading;

  @computed
  bool get hasError => _hasError;

  @action
  void setProdutos({required List<ModelProduto>? produtos}) {
    _listaProdutos.clear();
    if (produtos != null && produtos.isNotEmpty) {
      _listaProdutos.addAll(produtos);
    }
  }

  @action
  void setLoading({required bool value}) {
    _loading = value;

    if (value) {
      _hasError = false;
    }
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }
}
