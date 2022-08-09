import 'package:flutter/material.dart';
import 'package:http_sample_project/models/countries.dart';
import 'package:http_sample_project/screens/login_screen/login_screen.dart';
import 'package:http_sample_project/screens/select_country_screen/selectCountrBloc.dart';
import 'package:http_sample_project/screens/select_country_screen/widgets/select_language_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final bloc = SelectCountryBloc();

  @override
  void initState() {
    bloc.getListOfCountry("en");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t!.appTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SelectLanguageWidget(
              bloc: bloc,
            ),
            Text(t.selectCountry),
            FutureBuilder<List<CountriesData>>(
                future: bloc.getListOfCountry(bloc.currentSelection == 0 ? "en" : "ar"),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      bloc.listOfCities = [];
                                      bloc.selectedCountryIndex = index;
                                      bloc.selectedCountryId = snapshot.data![index].id!;

                                      bloc.getListOfCities(
                                          bloc.currentSelection == 0 ? "en" : "ar", bloc.listOfCountries[index].id!);

                                      setState(() {});
                                    },
                                    child: Container(
                                      height: bloc.selectedCountryIndex == null || bloc.selectedCountryIndex != index ? 70 : 300,
                                      width: 100,
                                      color: Colors.black54,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(25),
                                                  child: Image.network(snapshot.data![index].flagImage!,
                                                      width: 50, height: 50, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Text(snapshot.data![index].name!),
                                            ],
                                          ),
                                          Expanded(
                                            child: bloc.listOfCities.length > 0
                                                ? ListView.builder(
                                                    itemCount: bloc.listOfCities.length,
                                                    itemBuilder: (ctx, index1) {
                                                      return Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                  builder: (ctx) => LoginScreen(
                                                                    countryId: bloc.selectedCountryId,
                                                                    cityId: bloc.listOfCities[index1].id!,
                                                                    countryName: snapshot.data![index].name!,
                                                                    cityName: bloc.listOfCities[index1].name!,
                                                                  ),
                                                                ),
                                                                (route) => false);
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            child: Center(
                                                              child: Text(
                                                                bloc.listOfCities[index1].name!,
                                                              ),
                                                            ),
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                : bloc.selectedCountryIndex == index
                                                    ? const Center(child: CircularProgressIndicator())
                                                    : Container(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
