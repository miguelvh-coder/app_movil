class History {
  
  History({this.id, required this.time, required this.email, required this.points,});

  int? id;
  int time;
  String email;
  int points;

  String get emailAddress => email;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        time: json["time"] ?? 1,
        email: json["email"] ?? "someemail@loco.com",
        points: json["points"]?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "email": email,
        "time":time,
        "points": points,
      };
}