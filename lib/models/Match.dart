class Matche {
  static List<Matche> listMatches = [
    Matche(valid: false),
    Matche(valid: false),
    Matche(valid: false),
    Matche(valid: false)
  ];
  String? id,
      date,
      arbitre_centre,
      arbitre_ass1,
      arbitre_ass2,
      equipe_recevante,
      equipe_visteuse;
  bool valid;
  Matche(
      {this.id,
      this.date,
      this.arbitre_centre,
      this.arbitre_ass1,
      this.arbitre_ass2,
      this.equipe_recevante,
      this.equipe_visteuse,
      required this.valid});
}
