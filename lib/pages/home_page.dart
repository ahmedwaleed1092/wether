import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether/pages/search_page.dart';
import 'package:wether/providers/wether_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = "${now.hour}:${now.minute}";

    return ChangeNotifierProvider<WeatherProvider>(
      create: (c) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (_, weather, _) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchPage();
                        },
                      ),
                    ).then((x) async {
                      if (x is String) {
                        await weather.searchSubmit(x);
                      }
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              title: const Text('tap to search'),
            ),
            body:
                weather.wether == null
                    ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Text('no search now '), Text('search now')],
                      ),
                    )
                    : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(flex: 3),
                          Text(
                            weather.cityName ??
                                'not avilable city in this name ',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'updated in : ${formattedTime}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network('http:${weather.wether?.icon}'),
                              Text(
                                '${weather.wether?.temp.toInt()}',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'max : ${weather.wether?.maxTemp.toInt()}',
                                  ),
                                  Text(
                                    'min : ${weather.wether?.minTemp.toInt()}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          if (weather.wether != null) ...{
                            Text(
                              weather.wether!.wetherSateName ?? "no weather  ",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(flex: 5),
                          },
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }
}
