class User {
  String email;
  String password;
  String firstName;
  String lastName;
  String confirmPassword;
  String addressLine1;
  String city;
  String state;
  String postalCode;
  String phoneDeviceType;
  String countryCode;
  String phoneNumber;
  List<Map<String, String>> resumes; // Array of resume paths

  // New fields
  String availabilityStartDate;
  String preferredWorkSchedule;
  String salaryExpectations;
  String desiredSalary;
  String salaryHistory;
  String workAuthorization;
  String sponsorshipRequired;
  String fullOrPartTimeAvailability;
  String felonyConviction;
  String misdemeanorConviction;
  String relatedConviction;
  String minorityMember;
  String disability;
  String interestPosition;
  String fitRole;
  String challengingSituation;

  User({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required this.addressLine1,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.phoneDeviceType,
    required this.countryCode,
    required this.phoneNumber,
    required this.resumes,
    // Initialize new fields
    required this.availabilityStartDate,
    required this.preferredWorkSchedule,
    required this.salaryExpectations,
    required this.desiredSalary,
    required this.salaryHistory,
    required this.workAuthorization,
    required this.sponsorshipRequired,
    required this.fullOrPartTimeAvailability,
    required this.felonyConviction,
    required this.misdemeanorConviction,
    required this.relatedConviction,
    required this.minorityMember,
    required this.disability,
    required this.interestPosition,
    required this.fitRole,
    required this.challengingSituation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Parse resumes list
    List<dynamic> resumesJson = json['resumes'] ?? [];
    List<Map<String, String>> resumesList = [];
    for (var resumeJson in resumesJson) {
      resumesList.add({
        'fileId': resumeJson['fileId'],
        'filename': resumeJson['filename'],
      });
    }

    return User(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String? ?? '', // Provide default value ''
      lastName: json['lastName'] as String? ?? '', // Provide default value ''
      confirmPassword:
          json['confirmPassword'] as String? ?? '', // Provide default value ''
      addressLine1:
          json['addressLine1'] as String? ?? '', // Provide default value ''
      city: json['city'] as String? ?? '', // Provide default value ''
      state: json['state'] as String? ?? '', // Provide default value ''
      postalCode:
          json['postalCode'] as String? ?? '', // Provide default value ''
      phoneDeviceType:
          json['phoneDeviceType'] as String? ?? '', // Provide default value ''
      countryCode:
          json['countryCode'] as String? ?? '', // Provide default value ''
      phoneNumber:
          json['phoneNumber'] as String? ?? '', // Provide default value ''
      resumes: resumesList,
      // Initialize new fields with default values
      availabilityStartDate: json['availabilityStartDate'] as String? ?? '',
      preferredWorkSchedule: json['preferredWorkSchedule'] as String? ?? '',
      salaryExpectations: json['salaryExpectations'] as String? ?? '',
      desiredSalary: json['desiredSalary'] as String? ?? '',
      salaryHistory: json['salaryHistory'] as String? ?? '',
      workAuthorization: json['workAuthorization'] as String? ?? '',
      sponsorshipRequired: json['sponsorshipRequired'] as String? ?? '',
      fullOrPartTimeAvailability:
          json['fullOrPartTimeAvailability'] as String? ?? '',
      felonyConviction: json['felonyConviction'] as String? ?? '',
      misdemeanorConviction: json['misdemeanorConviction'] as String? ?? '',
      relatedConviction: json['relatedConviction'] as String? ?? '',
      minorityMember: json['minorityMember'] as String? ?? '',
      disability: json['disability'] as String? ?? '',
      interestPosition: json['interestPosition'] as String? ?? '',
      fitRole: json['fitRole'] as String? ?? '',
      challengingSituation: json['challengingSituation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'confirmPassword': confirmPassword,
      'addressLine1': addressLine1,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'phoneDeviceType': phoneDeviceType,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'resumes': resumes,
      'availabilityStartDate': availabilityStartDate,
      'preferredWorkSchedule': preferredWorkSchedule,
      'salaryExpectations': salaryExpectations,
      'desiredSalary': desiredSalary,
      'salaryHistory': salaryHistory,
      'workAuthorization': workAuthorization,
      'sponsorshipRequired': sponsorshipRequired,
      'fullOrPartTimeAvailability': fullOrPartTimeAvailability,
      'felonyConviction': felonyConviction,
      'misdemeanorConviction': misdemeanorConviction,
      'relatedConviction': relatedConviction,
      'minorityMember': minorityMember,
      'disability': disability,
      'interestPosition': interestPosition,
      'fitRole': fitRole,
      'challengingSituation': challengingSituation,
    };
  }
}
