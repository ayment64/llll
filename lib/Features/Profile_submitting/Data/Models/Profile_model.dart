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
  factory ProfileModel.fromFindUserJson(Map<String, dynamic> json) {
    return ProfileModel(
        firstname: json['Company']["user"]["firstname"],
        lastname: json['Company']["user"]["lastname"],
        email: json['Company']["user"]["email"],
        companyName: json['Company']["company"],
        companyEmail: json['Company']["email"],
        phoneNumber: json['Company']["phone1"],
        mobileNumber: json['Company']["phone2"],
        caompanyWebsite: json['Company']["website"],
        faxNumber: json['Company']["fax"],
        adress: json['Company']["address"],
        street: json['Company']["street"],
        streetNumber: json['Company']["streetNumber"], //state
        state: json['Company']["state"], //zipCode
        zipCode: json['Company']["zipCode"],
        city: json['Company']["city"],
        country: json['Company']["country"]);
  }
  factory ProfileModel.fromMyTeamJson(Map<String, dynamic> json) {
    return ProfileModel(
        firstname: json['ofPartner']["user"]["firstname"],
        lastname: json['ofPartner']["user"]["lastname"],
        email: json['ofPartner']["user"]["email"],
        companyName: json['ofPartner']["company"],
        companyEmail: json['ofPartner']["email"],
        phoneNumber: json['ofPartner']["phone1"],
        mobileNumber: json['ofPartner']["phone2"],
        caompanyWebsite: json['ofPartner']["website"],
        faxNumber: json['ofPartner']["fax"],
        adress: json['ofPartner']["address"],
        street: json['ofPartner']["street"],
        streetNumber: json['ofPartner']["streetNumber"], //state
        state: json['ofPartner']["state"], //zipCode
        zipCode: json['ofPartner']["zipCode"],
        city: json['ofPartner']["city"],
        country: json['ofPartner']["country"]);
  }
}
