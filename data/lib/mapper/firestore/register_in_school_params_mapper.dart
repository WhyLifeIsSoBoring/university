import 'package:data/model/params/register_in_school_params.dart';

const String _SCHOOL_TITLE = 'school_title';
const String _STUDENT_EMAIL = 'student_email';
const String _STUDENT_FIRST_NAME = 'student_first_name';
const String _STUDENT_LAST_NAME = 'student_last_name';
const String _STUDENT_PHONE_NUMBER = 'student_phone_number';

class RegisterInSchoolParamsToFirestoreMapper {
  static Map<String, dynamic> toFirestore(RegisterInSchoolParams params) {
    return <String, dynamic>{
      _SCHOOL_TITLE: params.schoolTitle,
      _STUDENT_EMAIL: params.studentEmail,
      _STUDENT_FIRST_NAME: params.studentFirstName,
      _STUDENT_LAST_NAME: params.studentLastName,
      _STUDENT_PHONE_NUMBER: params.studentPhoneNumber,
    };
  }
}
