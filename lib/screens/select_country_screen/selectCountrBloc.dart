import 'package:http_sample_project/models/countries.dart';
import 'package:http_sample_project/utils/repo/http_repo.dart';

class SelectCountryBloc {
  List<Data> listOfCountries = [];

  Future<List<Data>> getListOfCountry() async {
    final response = await HttpRepo().callRequest(requestType: HttpMethods.get, methodName: "countries");

    listOfCountries = Countries.fromJson(response).data!;

    print(listOfCountries);
    return listOfCountries;
  }
}
