class RomModel {
  String? romName;
  num? version;
  String? state;
  String? downloadLink;
  String? xda;
  String? preview;
  String? description;

  RomModel(
      {this.romName,
      this.version,
      this.state,
      this.downloadLink,
      this.xda,
      this.preview,
      this.description});

  RomModel.fromJson(Map<String, dynamic> json) {
    romName = json['romName'];
    version = json['version'];
    state = json['state'];
    downloadLink = json['downloadLink'];
    xda = json['xda'];
    preview = json['preview'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['romName'] = romName;
    data['version'] = version;
    data['state'] = state;
    data['downloadLink'] = downloadLink;
    data['xda'] = xda;
    data['preview'] = preview;
    data['description'] = description;
    return data;
  }
}
