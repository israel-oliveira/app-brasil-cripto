import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AppPriceGraphic extends StatelessWidget {
  final List<double> prices;

  const AppPriceGraphic({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    // Verificar se a lista de preços está vazia
    if (prices.isEmpty) {
      return const SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'Sem dados para exibir',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    // Converter os preços para pontos de gráfico
    List<FlSpot> spots = prices.asMap().entries.map((entry) {
      int index = entry.key;
      double price = entry.value; // Obter preço
      return FlSpot(index.toDouble(), price); // Criar ponto
    }).toList();

    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false), // Remove as linhas de grade
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Remove valores do eixo Y
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Remove valores do eixo X
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Remove valores do topo
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Remove valores do lado direito
          ),
          borderData: FlBorderData(show: false), // Remove a borda do gráfico
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true, // Deixa o gráfico curvado
              barWidth: 3, // Espessura da linha
              dotData: FlDotData(show: false), // Remove os pontos no gráfico
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}