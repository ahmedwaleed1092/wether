import 'package:flutter/material.dart';
import 'package:wether/models/wether_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search a City ')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (value) async {
              // try {
              //   WeatherModel.fromjson(value) == null;

              // } catch (e) {
              //   print(e);
              // }
              if (Navigator.canPop(context)) {
                Navigator.maybePop(context, value);
              }
              // await weather.searchSubmit(value);
              // if (!context.mounted) return;
            },
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              label: Text('Search'),
              hintText: "Enter a City ",
            ),
          ),
        ),
      ),
    );
  }
}
