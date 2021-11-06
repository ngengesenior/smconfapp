class Speaker {
  Speaker({
    this.bio,
    this.name,
    this.photoUrl,
    this.title,
    this.twitter,
    this.linkedIn,});

  Speaker.fromJson(dynamic json) {
    bio = json['bio'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    title = json['title'];
    twitter = json['twitter'];
    linkedIn = json['linkedIn'];
  }
  String? bio;
  String? name;
  String? photoUrl;
  String? title;
  String? twitter;
  String? linkedIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bio'] = bio;
    map['name'] = name;
    map['photoUrl'] = photoUrl;
    map['title'] = title;
    map['twitter'] = twitter;
    map['linkedIn'] = linkedIn;
    return map;
  }

}