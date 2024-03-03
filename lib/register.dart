import 'package:flutter/material.dart';
import 'package:jobaiassitant/user.model.dart';

class RegisterScreen extends StatefulWidget {
  final data;
  RegisterScreen({required this.data});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneDeviceTypeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController preferredWorkScheduleController =
      TextEditingController();
  TextEditingController salaryExpectationsController = TextEditingController();
  TextEditingController desiredSalaryController = TextEditingController();
  TextEditingController salaryHistoryController = TextEditingController();

  TextEditingController interestPositionController = TextEditingController();
  TextEditingController fitRoleController = TextEditingController();
  TextEditingController challengingSituationController =
      TextEditingController();

  String? fullOrPartTimeAvailability;
  String? workAuthorization;
  String? legallyAuthorizedToWork;
  String? sponsorshipRequired;
  String? convictedOfFelony;
  String? convictedOfMisdemeanor;
  String? convictedOfJobRelatedCrime;
  String? minorityGroupMember;
  String? disabilityAccommodation;
  String? selectedCountryPhoneCode;

  @override
  void initState() {
    super.initState();
    User? user = widget.data;
    emailAddressController.text = user!.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: legalNameController,
                  decoration: const InputDecoration(labelText: 'Legal Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your legal name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: firstNameController,
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameController,
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  decoration:
                      const InputDecoration(labelText: 'Address Line 1'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cityController,
                        decoration: const InputDecoration(labelText: 'City'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: stateController,
                        decoration: const InputDecoration(labelText: 'State'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: postalCodeController,
                  decoration: const InputDecoration(labelText: 'Postal Code'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your postal code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailAddressController,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneDeviceTypeController,
                  decoration:
                      const InputDecoration(labelText: 'Phone Device Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone device type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Country Phone Code',
                        ),
                        value: selectedCountryPhoneCode,
                        items: const [
                          DropdownMenuItem(
                            value: '+1',
                            child: Text('+1 (United States)'),
                          ),

                          // Add more countries as needed
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedCountryPhoneCode = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: phoneNumberController,
                        decoration:
                            const InputDecoration(labelText: 'Phone Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                // Availability Section
                TextFormField(
                  controller: startDateController,
                  decoration: const InputDecoration(labelText: 'Start Date'),
                  onTap: () async {
                    // Show date picker
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      startDateController.text =
                          pickedDate.toString().substring(0, 10);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select start date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Full-Time or Part-Time Availability',
                  ),
                  value: fullOrPartTimeAvailability,
                  items: const [
                    DropdownMenuItem(
                      value: 'Full-Time',
                      child: Text('Full-Time'),
                    ),
                    DropdownMenuItem(
                      value: 'Part-Time',
                      child: Text('Part-Time'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      fullOrPartTimeAvailability = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select availability';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: preferredWorkScheduleController,
                  decoration: const InputDecoration(
                      labelText: 'Preferred Work Schedule'),
                ),
                TextFormField(
                  controller: salaryExpectationsController,
                  decoration:
                      const InputDecoration(labelText: 'Salary Expectations'),
                ),

// Desired Salary Section
                TextFormField(
                  controller: desiredSalaryController,
                  decoration:
                      const InputDecoration(labelText: 'Desired Salary'),
                ),
                TextFormField(
                  controller: salaryHistoryController,
                  decoration:
                      const InputDecoration(labelText: 'Salary History'),
                ),

// Work Authorization Section
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Legally Authorized to Work'),
                  value: workAuthorization,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      workAuthorization = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Will you require sponsorship?'),
                  value: sponsorshipRequired,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sponsorshipRequired = value;
                    });
                  },
                ),

// Criminal History Section
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(labelText: 'Convicted of Felony'),
                  value: convictedOfFelony,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      convictedOfFelony = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Convicted of Misdemeanor'),
                  value: convictedOfMisdemeanor,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      convictedOfMisdemeanor = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Convicted of Job-Related Crime'),
                  value: convictedOfJobRelatedCrime,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      convictedOfJobRelatedCrime = value;
                    });
                  },
                ),

// Diversity and Equal Opportunity Section
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Member of Minority Groups'),
                  value: minorityGroupMember,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      minorityGroupMember = value;
                    });
                  },
                ),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Disability (Require Accommodation)'),
                  value: disabilityAccommodation,
                  items: const [
                    DropdownMenuItem(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      disabilityAccommodation = value;
                    });
                  },
                ),

                // Additional Questions Section
                TextFormField(
                  controller: interestPositionController,
                  decoration:
                      const InputDecoration(labelText: 'Interest in Position'),
                ),
                TextFormField(
                  controller: fitRoleController,
                  decoration: const InputDecoration(labelText: 'Fit for Role'),
                ),
                TextFormField(
                  controller: challengingSituationController,
                  decoration: const InputDecoration(
                      labelText: 'Challenging Work Situation'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, serialize user data to JSON
                        User model = User(
                          email: emailAddressController.text,
                          password: widget.data
                              .password, // Password not included for security reasons
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          confirmPassword:
                              '', // Not included for security reasons
                          addressLine1: addressController.text,
                          city: cityController.text,
                          state: stateController.text,
                          postalCode: postalCodeController.text,
                          phoneDeviceType: phoneDeviceTypeController.text,
                          countryCode: selectedCountryPhoneCode ?? '',
                          phoneNumber: phoneNumberController.text,
                          resumes: [], // Initialize resumes list
                          // New fields
                          availabilityStartDate: startDateController.text,
                          preferredWorkSchedule:
                              preferredWorkScheduleController.text,
                          salaryExpectations: salaryExpectationsController.text,
                          desiredSalary: desiredSalaryController.text,
                          salaryHistory: salaryHistoryController.text,
                          workAuthorization: workAuthorization ?? '',
                          sponsorshipRequired: sponsorshipRequired ?? '',
                          fullOrPartTimeAvailability:
                              fullOrPartTimeAvailability ?? '',
                          felonyConviction: convictedOfFelony ?? '',
                          misdemeanorConviction: convictedOfMisdemeanor!,
                          relatedConviction: convictedOfJobRelatedCrime!,
                          minorityMember: minorityGroupMember ?? '',
                          disability: disabilityAccommodation ?? '',
                          interestPosition: interestPositionController.text,
                          fitRole: fitRoleController.text,
                          challengingSituation:
                              challengingSituationController.text,
                        );

                        // Navigate to the next screen
                        Navigator.pushNamed(context, '/uploadResume',
                            arguments: model);
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
