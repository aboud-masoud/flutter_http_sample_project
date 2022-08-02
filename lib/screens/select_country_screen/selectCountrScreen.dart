import 'package:flutter/material.dart';
import 'package:http_sample_project/models/countries.dart';
import 'package:http_sample_project/screens/select_country_screen/selectCountrBloc.dart';

class SelectCountryScreen extends StatefulWidget {
  SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final bloc = SelectCountryBloc();

  @override
  void initState() {
    bloc.getListOfCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Data>>(
          future: bloc.getListOfCountry(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.orange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(snapshot.data![index].flagImage!),
                              Text(snapshot.data![index].name!),
                            ],
                          ),
                        ),
                      );
                    })
                : const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
