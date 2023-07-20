class Entriess {
  int? count;
  List<Entries>? entries;

  Entriess({this.count, this.entries});

  Entriess.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (entries != null) {
      data['entries'] = entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  int? id;
  String? aPI;
  String? description;
  String? auth;
  String? hTTPS;
  String? cors;
  String? link;
  String? category;

  Entries(
      {this.id,
      this.aPI,
      this.description,
      this.auth,
      this.hTTPS,
      this.cors,
      this.link,
      this.category});

  Entries.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    aPI = json['API'];
    description = json['Description'];
    auth = json['Auth'];
    hTTPS = json['HTTPS'].toString();
    cors = json['Cors'];
    link = json['Link'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['API'] = aPI;
    data['Description'] = description;
    data['Auth'] = auth;
    data['HTTPS'] = hTTPS;
    data['Cors'] = cors;
    data['Link'] = link;
    data['Category'] = category;
    return data;
  }
}
