class ModelProduto {
  ModelProduto.fromMap(dynamic data) {
    _proId = data['pro_id'];
    _proDescricao = data['pro_descricao'];
    _proPreco = data['pro_preco'];
    _proImagem = data['pro_imagem'];
  }

  late int? _proId;
  late String? _proDescricao;
  late double? _proPreco;
  late String? _proImagem;

  int? get proId => _proId;
  String? get proDescricao => _proDescricao;
  double? get proPreco => _proPreco;
  String? get proImagem => _proImagem;

  void setId(int id) {
    _proId = id;
  }

  void setDescricao(String descricao) {
    _proDescricao = descricao;
  }

  void setPreco(double preco) {
    _proPreco = preco;
  }

  void setImagem(String? image) {
    _proImagem = image;
  }

  ModelProduto.constructor(proId, descricao, preco, imagem) {
    _proId = proId;
    _proDescricao = descricao;
    _proPreco = double.parse(preco);
    _proImagem = imagem;
  }
}
