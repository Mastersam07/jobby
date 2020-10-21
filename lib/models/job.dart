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

List<Job> companyList = [
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
];

List<Job> recentList = [
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
  Job(
    companyName: "Nike",
    title: "Senior UI Designer",
    location: "California, CA",
    // sallary: "\$50K - \$90K",
    // image: "assets/nike-Logo.png",
    tags: [
      "Full Time",
      "Remote",
      "Anywhere",
    ],
    type: "Full Time",
    description:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // jobResponsbilities: [
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    //   "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
    // ],
    // aboutCompany:
    //     "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
  ),
];
