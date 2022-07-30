import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/prices_list_model.dart';
import 'package:flutter_application_1/view_models/prices_view_model.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PricesViewModel())],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: HomewScreen()));
  }
}

class HomewScreen extends StatefulWidget {
  const HomewScreen({Key? key}) : super(key: key);

  @override
  State<HomewScreen> createState() => _HomewScreenState();
}

class _HomewScreenState extends State<HomewScreen> {
  @override
  Widget build(BuildContext context) {
    PricesViewModel pricesViewModel = context.watch<PricesViewModel>();
    return Column(
      children: [_ui(pricesViewModel)],
    );
  }

  _ui(PricesViewModel pricesViewModel) {
    if (pricesViewModel.loading) {
      return Container(
        child: Text('loading'),
      );
    }

    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        List<Object>? pricesListModel = pricesViewModel.pricesList;
        List<FlSpot> points = [];
        // for (int i = 0; i < pricesListModel!.length; i++) {
        //   points.add(FlSpot(pricesListModel[index], 1));
        // }
        print(pricesListModel!.length);
        return Container(
          child: Text(
            pricesListModel[index].toString(),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      // itemCount: pricesViewModel.pricesList?.prices.length ?? 0,
      itemCount: pricesViewModel.pricesList?.length ?? 0,
    ));
  }
}
