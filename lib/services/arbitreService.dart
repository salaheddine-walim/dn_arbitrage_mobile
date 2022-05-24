import 'package:dio/dio.dart';
import 'package:dn_arbitrage/models/Arbitre.dart';
import 'package:dn_arbitrage/services/Urls.dart';

class ArbitreServices {
  static List<Arbitre> initArbitres(var object) {
    List<Arbitre> listeArbitres = [];
    //listeEquipes.add(Equipe('0', 'Equipe'));

    for (var arbitre in object) {
      listeArbitres.add(Arbitre(
          arbitre['id'].toString(),
          arbitre['personne']['cin'],
          arbitre['personne']['nom'],
          arbitre['personne']['prenom'],
          arbitre['specialite'],
          arbitre['ligue']));
    }
    return listeArbitres;
  }

  static Future<List<Arbitre>> fetchArbitres() async {
    Response response = await Dio().get(Urls.baseApiUrl + '/arbitres');
    print(response.data);
    List<Arbitre> listeArbitres = initArbitres(response.data);
    return listeArbitres;
  }
}
