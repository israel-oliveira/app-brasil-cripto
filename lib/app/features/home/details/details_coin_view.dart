import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/listener_view.dart';
import 'package:app_cripto/app/core/ui/widgets/app_state_empty.dart';
import 'package:app_cripto/app/domain/models/coin/coin_detail_model.dart';
import 'package:app_cripto/app/features/home/details/details_coin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DetailsCoinView extends StatefulWidget {
  const DetailsCoinView({super.key});

  @override
  State<DetailsCoinView> createState() => _DetailsCoinViewState();
}

class _DetailsCoinViewState extends State<DetailsCoinView> {
  late String? coinId;

  @override
  void initState() {
    super.initState();

    ListenerView(
      viewModel: context.read<DetailsCoinViewModel>(),
    ).listener(context: context, successCallback: (viewModel, listenerView) {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (coinId != null) {
        context.read<DetailsCoinViewModel>().loadCoinDetail(coinId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    coinId = ModalRoute.of(context)?.settings.arguments as String?;

    return Observer(
      builder: (context) {
        CoinDetailModel? coinDetail = context
            .read<DetailsCoinViewModel>()
            .coinDetail;

        if (coinDetail == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Detalhes da Moeda')),
            body: AppStateEmpty(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              coinDetail.name,
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (coinId == null) {
                return AppStateEmpty(
                  child: Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Voltar',
                        style: TextStyle(color: context.primaryColor),
                      ),
                    ),
                  ),
                );
              }
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox.square(dimension: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Image.network(
                                coinDetail.image['large'] ?? '',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox.square(dimension: 20),
                            Text(
                              coinDetail.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox.square(dimension: 20),
                        Text(
                          'Preço Atual: ${coinDetail.marketData.currentPrice['usd']} USD',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox.square(dimension: 20),
                        // Add more details as needed
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
