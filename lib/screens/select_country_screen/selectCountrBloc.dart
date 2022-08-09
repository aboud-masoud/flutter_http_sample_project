import 'package:flutter/material.dart';
import 'package:http_sample_project/main.dart';
import 'package:http_sample_project/models/cities.dart';
import 'package:http_sample_project/models/countries.dart';
import 'package:http_sample_project/utils/repo/http_repo.dart';

class SelectCountryBloc {
  List<CountriesData> listOfCountries = [];
  List<CitiesResponseData> listOfCities = [];
  int? selectedCountryIndex = null;

  int selectedCountryId = 0;

  int currentSelection = 0;

  Future<List<CountriesData>> getListOfCountry(String language) async {
    final response = await HttpRepo().callRequest(requestType: HttpMethods.get, methodName: "countries", language: language);

    listOfCountries = Countries.fromJson(response).data!;
    return listOfCountries;
  }

  Future<List<dynamic>> getListOfCities(String language, int countryId) async {
    final response =
        await HttpRepo().callRequest(requestType: HttpMethods.get, methodName: "cities/$countryId", language: language);

    listOfCities = CitiesResponse.fromJson(response).data!;
    return listOfCountries;
  }

  void refreshAppWithLanguageCode(BuildContext context, String code) {
    // selectedLanguage = code;
    // listOfCountriesNotifier.value = null;
    MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: code));
    getListOfCountry(code);
    if (selectedCountryIndex != null) {
      getListOfCities(code, selectedCountryId);
    }
  }
}
