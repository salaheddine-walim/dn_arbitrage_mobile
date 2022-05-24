import 'package:dn_arbitrage/models/Match.dart';
import 'package:dn_arbitrage/services/arbitreService.dart';
import 'package:dn_arbitrage/services/equipeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listEquipes = [], _listArbitres = [];
  List<Matche> _listMatches = Matche.listMatches;

  @override
  void initState() {
    super.initState();
    useFetch();
  }

  void useFetch() async {
    var equipes = await EquipeServices.fetchEquipes();
    var arbitres = await ArbitreServices.fetchArbitres();

    setState(() {
      _listEquipes = equipes;
      _listArbitres = arbitres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match planning'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var match in Matche.listMatches)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Botola Pro 1'),
                        subtitle: Text(
                          'Journee x - Match ${Matche.listMatches.indexOf(match) + 1}',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: DropdownButton(
                                hint: Text('Equipe Recevante'),
                                underline: SizedBox(),
                                value: _listMatches[_listMatches.indexOf(match)]
                                    .equipe_recevante,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.lightBlue,
                                ),
                                items: _listEquipes.map((e) {
                                  return DropdownMenuItem(
                                    child: e.aka == ''
                                        ? Text(e.aka[0].toUpperCase() +
                                            e.aka.substring(1))
                                        : Text(
                                            e.aka[0].toUpperCase() +
                                                e.aka.substring(1),
                                            style: TextStyle(
                                                color: Colors.lightBlue),
                                          ),
                                    value: e.id.toString(),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _listMatches[_listMatches.indexOf(match)]
                                        .equipe_recevante = newValue!;
                                    //print('equipe_rec ' + eq_rec!);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(child: Text('VS')),
                            ),
                            Expanded(
                              flex: 3,
                              child: DropdownButton(
                                hint: Text('Equipe Visiteuse'),
                                underline: SizedBox(),
                                value: _listMatches[_listMatches.indexOf(match)]
                                    .equipe_visteuse,
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.lightBlue,
                                ),
                                items: _listEquipes.map((e) {
                                  return DropdownMenuItem(
                                    child: e.aka == ''
                                        ? Text(e.aka[0].toUpperCase() +
                                            e.aka.substring(1))
                                        : Text(
                                            e.aka[0].toUpperCase() +
                                                e.aka.substring(1),
                                            style: TextStyle(
                                                color: Colors.lightBlue),
                                          ),
                                    value: e.id.toString(),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      _listMatches[_listMatches.indexOf(match)]
                                          .equipe_visteuse = newValue!;
                                      //print('equipe_rec ' + eq_vis!);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      _listMatches[_listMatches.indexOf(match)]
                                  .equipe_recevante !=
                              _listMatches[_listMatches.indexOf(match)]
                                  .equipe_visteuse
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      _listMatches[_listMatches.indexOf(match)]
                                          .valid = false;
                                      print(_listMatches[
                                              _listMatches.indexOf(match)]
                                          .valid);
                                    },
                                  );
                                },
                                child: Text('Valider'),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
