class JobModel {
  String company;
  String description;
  String jobLink;
  String location;
  double matchScore;
  String postedOn;
  String title;
  String url;

  JobModel({
    required this.company,
    required this.description,
    required this.jobLink,
    required this.location,
    required this.matchScore,
    required this.postedOn,
    required this.title,
    required this.url,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      company: json['company'],
      description: json['description'],
      jobLink: json['job_link'],
      location: json['location'],
      matchScore: json['match_score'],
      postedOn: json['postedOn'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['description'] = this.description;
    data['job_link'] = this.jobLink;
    data['location'] = this.location;
    data['match_score'] = this.matchScore;
    data['postedOn'] = this.postedOn;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'JobModel{company: $company, description: $description, jobLink: $jobLink, location: $location, matchScore: $matchScore, postedOn: $postedOn, title: $title, url: $url}';
  }
}
