class RespuestaChuck {
  String? value;

  RespuestaChuck({
    required this.value,
  });

  factory RespuestaChuck.fromJson(Map<String, dynamic> json) {
    return RespuestaChuck(
      value: json["value"] ?? "",
    );
  }
}
