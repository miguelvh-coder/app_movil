class User {
  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.colegio,
      required this.grado,
      required this.fN,
      required this.password,
      required this.difficult
      });

  int? id;
  String firstName;
  String lastName;
  String email;
  String colegio;
  String fN;
  String grado;
  String difficult;
  String password;

  String get name => '$firstName $lastName';

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        colegio: json["colegio"] ?? "somecolegio",
        fN: json["Fecha de Nacimiento"] ?? "00/00/0000",
        grado: json["grado de escolaridad"] ?? "0",
        difficult: json["Dificultad"] ?? "difa",
        password: json["contraseña"] ?? "somecontraseña",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "colegio": colegio,
        "fN": fN,
        "grado": grado,
        "difficult": difficult,
        "password": password,
      };
}
