import "package:meta/meta.dart";

class Profile {
  final String firstname;
  final String lastname;
  final String email;
  final String companyName;
  final String companyEmail;
  final String phoneNumber;
  final String mobileNumber;
  final String caompanyWebsite;
  final String faxNumber;
  final String adress;
  final String street;
  final String streetNumber;
  final String state;
  final String zipCode;
  final String city;
  final String country;

  Profile({
    @required this.firstname,
    @required this.lastname,
    @required this.email,
    @required this.companyName,
    @required this.companyEmail,
    @required this.phoneNumber,
    @required this.mobileNumber,
    @required this.caompanyWebsite,
    @required this.faxNumber,
    @required this.adress,
    @required this.street,
    @required this.streetNumber,
    @required this.state,
    @required this.zipCode,
    @required this.city,
    @required this.country,
  });
  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": companyEmail,
        "company": companyName,
        "phone": phoneNumber,
        "mobile": mobileNumber,
        "fax": faxNumber,
        "website": caompanyWebsite,
        "address": adress,
        "street": street,
        "street_nb": streetNumber,
        "state": state,
        "city": city,
        "zip": zipCode,
        "country": country,
        "long": 0,
        "lat": 0
      };
  @override
  String toString() {
    return "[" + this.companyName + "]";
  }
}
