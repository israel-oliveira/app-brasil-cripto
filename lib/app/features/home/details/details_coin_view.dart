import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/listener_view.dart';
import 'package:app_cripto/app/core/ui/widgets/app_delete_dialog.dart';
import 'package:app_cripto/app/core/ui/widgets/app_price_graphic.dart';
import 'package:app_cripto/app/core/ui/widgets/app_state_empty.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
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
  late CoinModel? coinId;

  @override
  void initState() {
    super.initState();

    ListenerView(
      viewModel: context.read<DetailsCoinViewModel>(),
    ).listener(context: context, successCallback: (viewModel, listenerView) {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (coinId != null) {
        context.read<DetailsCoinViewModel>().load(coinId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    coinId = ModalRoute.of(context)?.settings.arguments as CoinModel?;

    return Observer(
      builder: (context) {
        if (context.read<DetailsCoinViewModel>().coinDetail == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Detalhes da Moeda')),
            body: Center(child: AppStateEmpty()),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${context.read<DetailsCoinViewModel>().coinDetail!.name} (${context.read<DetailsCoinViewModel>().coinDetail!.symbol.toUpperCase()})',
            ),
            actions: [
              Observer(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      Icons.star,
                      color: context.read<DetailsCoinViewModel>().isFavorite
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                    onPressed: () async {
                      if (context.read<DetailsCoinViewModel>().isFavorite) {
                        AppDeleteDialog().show(
                          context,
                          title: 'Remover moeda',
                          content:
                              'Deseja remover ${context.read<DetailsCoinViewModel>().coinDetail?.name} das favoritas?',
                          onConfirm: () {
                            context
                                .read<DetailsCoinViewModel>()
                                .updateFavorities();
                          },
                        );
                      } else {
                        await context
                            .read<DetailsCoinViewModel>()
                            .updateFavorities();
                      }
                    },
                  );
                },
              ),
            ],
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
                                context
                                        .read<DetailsCoinViewModel>()
                                        .coinDetail!
                                        .image['large'] ??
                                    '',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox.square(dimension: 20),
                            Text(
                              context
                                  .read<DetailsCoinViewModel>()
                                  .coinDetail!
                                  .name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 40,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preço Atual:',
                                        style: context.titleDetailsInfo,
                                      ),
                                      Text(
                                        'R\$ ${context.read<DetailsCoinViewModel>().coinDetail!.marketData.currentPrice['brl']?.toStringAsFixed(2)} (BRL)',
                                        style: context.subtitleStyle,
                                      ),
                                      Text(
                                        'U\$ ${context.read<DetailsCoinViewModel>().coinDetail!.marketData.currentPrice['usd']?.toStringAsFixed(2)} (USD)',
                                        style: context.subtitleStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Variação 24h:',
                                        style: context.titleDetailsInfo,
                                      ),
                                      Text(
                                        '${context.read<DetailsCoinViewModel>().coinDetail!.marketData.priceChangePercentage24h?.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color:
                                              context
                                                      .read<
                                                        DetailsCoinViewModel
                                                      >()
                                                      .coinDetail!
                                                      .marketData
                                                      .priceChangePercentage24h! <
                                                  0
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(height: 20),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Volume de mercado:',
                                        style: context.titleDetailsInfo,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'R\$ ${context.read<DetailsCoinViewModel>().coinDetail!.marketData.totalVolume['brl']?.toStringAsFixed(2)} (BRL)',
                                        style: context.subtitleStyle,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'U\$ ${context.read<DetailsCoinViewModel>().coinDetail!.marketData.totalVolume['usd']?.toStringAsFixed(2)} (USD)',
                                        style: context.subtitleStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(height: 20),
                              Text(
                                'Preços dos Últimos 7 Dias',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              AppPriceGraphic(
                                prices:
                                    context
                                        .read<DetailsCoinViewModel>()
                                        .coinPriceHistory ??
                                    <double>[],
                              ),
                              Divider(height: 20),
                              Text(
                                'Descrição',
                                style: context.titleDetailsInfo,
                              ),
                              Text(
                                context
                                        .read<DetailsCoinViewModel>()
                                        .coinDetail!
                                        .description['en'] ??
                                    'Sem descrição disponível',
                              ),
                              SizedBox.square(dimension: 20),
                            ],
                          ),
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
