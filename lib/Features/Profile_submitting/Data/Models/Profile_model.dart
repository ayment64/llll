import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';

class ProfileModel extends Profile {
  ProfileModel(
      {@required final String firstname,
      @required final String lastname,
      @required final String email,
      @required final String companyName,
      @required final String companyEmail,
      @required final String phoneNumber,
      @required final String mobileNumber,
      @required final String caompanyWebsite,
      @required final String faxNumber,
      @required final String adress,
      @required final String street,
      @required final String streetNumber,
      @required final String state,
      @required final String zipCode,
      @required final String city,
      @required final String country})
      : super(
          firstname: firstname,
          lastname: lastname,
          email: email,
          companyName: companyName,
          companyEmail: companyEmail,
          phoneNumber: phoneNumber,
          mobileNumber: mobileNumber,
          caompanyWebsite: caompanyWebsite,
          faxNumber: faxNumber,
          adress: adress,
          street: street,
          streetNumber: streetNumber,
          state: state,
          zipCode: zipCode,
          city: city,
          country: country,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        firstname: json['Partner']["user"]["firstname"],
        lastname: json['Partner']["user"]["lastname"],
        email: json['Partner']["user"]["email"],
        companyName: json['Partner']["company"],
        companyEmail: json['Partner']["email"],
        phoneNumber: json['Partner']["phone1"],
        mobileNumber: json['Partner']["phone2"],
        caompanyWebsite: json['Partner']["website"],
        faxNumber: json['Partner']["fax"],
        adress: json['Partner']["address"],
        street: json['Partner']["street"],
        streetNumber: json['Partner']["streetNumber"], //state
        state: json['Partner']["state"], //zipCode
        zipCode: json['Partner']["zipCode"],
        city: json['Partner']["city"],
        country: json['Partner']["country"]);
  }
}