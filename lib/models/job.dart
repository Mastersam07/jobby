import 'dart:convert';

List<Job> jobFromJson(String str) =>
    new List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  int id;
  String title;
  String description;
  String location;
  String type;
  Null lastDate;
  String companyName;
  String website;
  List<String> tags;

  Job(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.type,
      this.lastDate,
      this.companyName,
      this.website,
      this.tags});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    type = json['type'];
    lastDate = json['last_date'];
    companyName = json['company_name'];
    website = json['website'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['location'] = this.location;
    data['type'] = this.type;
    data['last_date'] = this.lastDate;
    data['company_name'] = this.companyName;
    data['website'] = this.website;
    data['tags'] = this.tags;
    return data;
  }
}