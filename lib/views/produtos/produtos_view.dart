import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vaga/configs/routes/local_routes.dart';
import 'package:teste_vaga/database/controllers/db_produto_controller.dart';
import 'package:teste_vaga/models/model_produto/model_produto.dart';
import 'package:teste_vaga/services/dialog_service.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/services/service_locator.dart';
import 'package:teste_vaga/views/produtos/produtos_state.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';
import 'package:teste_vaga/widgets/cs_card_produto.dart';

class ProdutosView extends StatefulWidget {
  const ProdutosView({super.key});

  @override
  _ProdutosViewState createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {
  final stateView = getIt<ProdutosState>();
  String? urlImagem = '';
  TextEditingController urlController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  void _fetchData() async {
    try {
      stateView.setLoading(value: true);
      List<ModelProduto>? listaProdutos =
          await DbProdutoController.getAllProdutos();

      stateView.setProdutos(produtos: listaProdutos);
    } catch (_) {
      showSnackbar(description: 'Erro ao buscar os produtos');
    } finally {
      stateView.setLoading(value: false);
    }
  }

  void _onDeleteProduto(int? proId) async {
    try {
      if (proId != null) {
        await DbProdutoController.deleteProduto(proId);
      }
    } catch (error) {
      showSnackbar(description: 'Erro ao deletar produto');
    } finally {
      showSnackbar(description: 'Produto deletado com sucesso');
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CsAppBar(
        title: 'Produtos',
        actions: [
          TextButton.icon(
            label: const Text(
              'Limpar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () async {
              await DbProdutoController.deleteAllProdutos();
              _fetchData();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Observer(builder: (_) {
          if (stateView.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (stateView.listaProdutos.isNotEmpty) {
            return ListView.builder(
                itemCount: stateView.listaProdutos.length,
                itemBuilder: (context, index) {
                  var pro = stateView.listaProdutos[index];
                  return Column(
                    children: [
                      CsCardProduto(
                        descricao: pro.proDescricao,
                        urlImagem: pro.proImagem,
                        preco: pro.proPreco.toString(),
                        visualizarProduto: () async {
                          await getIt<NavigationService>().pushNamed(
                            LocalRoutes.CADASTRO_PRODUTO_SCREEN,
                            args:
                                pro,
                          );
                          _fetchData();
                        },
                        onDeleteProduto: () {
                          _onDeleteProduto(pro.proId);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: Text(
                'Nenhum Produto Cadastrado',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            );
          }
        }),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await getIt<NavigationService>()
              .pushNamed(LocalRoutes.CADASTRO_PRODUTO_SCREEN);

          _fetchData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text(
          'Cadastro Produto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
