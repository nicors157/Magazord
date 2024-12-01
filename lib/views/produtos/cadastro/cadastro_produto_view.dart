import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vaga/configs/assets/assets_path.dart';
import 'package:teste_vaga/database/controllers/db_produto_controller.dart';
import 'package:teste_vaga/models/model_produto/model_produto.dart';
import 'package:teste_vaga/services/dialog_service.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';

class CadastroProdutosView extends StatefulWidget {
  const CadastroProdutosView({super.key, this.produto});
  final ModelProduto? produto;

  @override
  _CadastroProdutosViewState createState() => _CadastroProdutosViewState();
}

class _CadastroProdutosViewState extends State<CadastroProdutosView> {
  String? urlImagem;
  TextEditingController urlController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.produto != null) {
      descricaoController.text = widget.produto!.proDescricao ?? '';
      precoController.text = widget.produto!.proPreco.toString();
      urlController.text = widget.produto!.proImagem ?? '';
      urlImagem = widget.produto!.proImagem ?? '';
    } else {
      urlImagem = '';
    }
  }

  Future<void> _cadastrarProduto() async {
    ModelProduto produto = ModelProduto.constructor(null,
        descricaoController.text, precoController.text, urlController.text);
    try {
      await DbProdutoController.insert(produto);
    } catch (error) {
      showSnackbar(description: 'Não foi possivel incluir o produto');
    } finally {
      urlController.text = '';
      descricaoController.text = '';
      precoController.text = '';
      urlImagem = '';
      showSnackbar(description: 'Produto cadastrado com sucesso!');
    }
  }

  Future<void> _updateProduto() async {
    ModelProduto produto = ModelProduto.constructor(widget.produto!.proId,
        descricaoController.text, precoController.text, urlController.text);
    try {
      await DbProdutoController.updateProduto(produto);
      urlController.text = '';
      descricaoController.text = '';
      precoController.text = '';
      urlImagem = '';
      showSnackbar(description: 'Produto alterado com sucesso!');
    } catch (error) {
      showSnackbar(description: 'Não foi possivel alterar o produto');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CsAppBar(title: 'Cadastro Produtos'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Observer(builder: (context) {
                  if (urlImagem!.isNotEmpty) {
                    return Image.network(
                      urlImagem!,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) {
                        return Image.asset(
                          AssetsPath.NO_IMAGE,
                          width: 150,
                          height: 150,
                          color: theme.colorScheme.primary,
                        );
                      },
                      width: 150,
                      height: 150,
                      //fit: BoxFit.scaleDown,
                    );
                  }
                  return Image.asset(
                    AssetsPath.NO_IMAGE,
                    width: 150,
                    height: 150,
                    color: theme.colorScheme.primary,
                    //fit: BoxFit.scaleDown,
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: descricaoController,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                ),
                decoration: const InputDecoration(
                    labelText: 'Descrição do Produto',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: precoController,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Preço do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextField(
                    controller: urlController,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Insira a Url da Imagem',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              urlImagem = '';
                              urlController.text = '';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Apagar Imagem',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              urlImagem = urlController.text;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Carregar Imagem',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.produto != null) {
                      _updateProduto();
                    } else {
                      _cadastrarProduto();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Salvar Produto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
