import 'dart:convert';

class Anakrequestmodel {
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final int? ayahId;
    final int? ibuId;
    final dynamic gambarAnak;

    Anakrequestmodel({
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.ayahId,
        this.ibuId,
        this.gambarAnak,
    });

    factory Anakrequestmodel.fromJson(String str) => Anakrequestmodel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Anakrequestmodel.fromMap(Map<String, dynamic> json) => Anakrequestmodel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        ayahId: json["ayah_id"],
        ibuId: json["ibu_id"],
        gambarAnak: json["gambar_anak"],
    );

    Map<String, dynamic> toMap() => {
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "ayah_id": ayahId,
        "ibu_id": ibuId,
        "gambar_anak": gambarAnak,
    };
}
