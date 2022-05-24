import 'package:dio/dio.dart';
import 'package:dn_arbitrage/models/Equipe.dart';
import 'package:dn_arbitrage/services/Urls.dart';

class EquipeServices {
  static List<Equipe> initEquipes(var object) {
    List<Equipe> listeEquipes = [];
    //listeEquipes.add(Equipe('0', 'Equipe'));

    for (var carbu in object) {
      listeEquipes.add(Equipe(carbu['id'].toString(), carbu['nom'],
          carbu['AKA'], carbu['ville'], carbu['terrain']));
    }
    return listeEquipes;
  }

  static Future<List<Equipe>> fetchEquipes() async {
    Response response = await Dio().get(Urls.baseApiUrl + '/equipes');
    List<Equipe> listeEquipes = initEquipes(response.data);
    return listeEquipes;
  }
}
