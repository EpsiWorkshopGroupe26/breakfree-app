import 'package:intl/intl.dart';

class Validators {
  // empty field verification
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    }
    return null;
  }

  // email verification
  static String? emailValidator(String value, {bool isRequired = false}) {
    if (isRequired && (value.isEmpty)) {
      return 'L\'adresse email ne peut pas être vide';
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value) &&
        value.isNotEmpty) {
      return 'L\'adresse email n\'est pas valide';
    }
    return null;
  }

  // password verification
  static String? passwordValidator(String value, {bool isRequired = false}) {
    if (value.isEmpty) {
      return 'Le mot de passe ne peut pas être vide';
    }
    if (value.length < 12 && value.isNotEmpty) {
      return 'Le mot de passe doit contenir au moins 12 caractères';
    }
    if (value.length > 20 && value.isNotEmpty) {
      return 'Le mot de passe doit contenir moins de 32 caractères';
    }
    return null;
  }

  // password confirmation verification
  static String? usernameValidator(String value, {bool isRequired = false}) {
    // check if username is empty
    if (isRequired && (value.isEmpty)) {
      return 'Le nom d\'utilisateur ne peut pas être vide';
    }
    // check if username is more than 3 characters
    if (value.isNotEmpty && value.length < 3) {
      return 'Le nom d\'utilisateur doit contenir au moins 3 caractères';
    }
    // check if username is less than 20 characters
    if (value.isNotEmpty && value.length > 20) {
      return 'Le nom d\'utilisateur doit contenir au plus 20 caractères';
    }
    // check if username is valid
    if (value.isNotEmpty && !RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Le nom d\'utilisateur ne peut contenir que des lettres, des chiffres et des tirets bas';
    }
    return null;
  }

  // name verification
  static String? nameValidator(String value, {bool isRequired = false}) {
    // check if name is empty
    if (isRequired && (value.isEmpty)) {
      return 'Le nom ne peut pas être vide';
    }
    // check if name is more than 3 characters
    if (value.isNotEmpty && value.length < 3) {
      return 'Le nom doit contenir au moins 3 caractères';
    }
    // check if name is less than 20 characters
    if (value.isNotEmpty && value.length > 20) {
      return 'Le nom doit contenir au plus 20 caractères';
    }
    // check if name is valid
    if (value.isNotEmpty && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Le nom ne peut contenir que des lettres';
    }
    return null;
  }

  // phone verification
  static String? phoneValidator(String value, {bool isRequired = false}) {
    // check if phone is empty
    if (isRequired && (value.isEmpty)) {
      return 'Le numéro de téléphone ne peut pas être vide';
    }
    // check if phone is valid
    if (value.isNotEmpty && !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Le numéro de téléphone ne peut contenir que des chiffres';
    }
    return null;
  }

  // start date / end date verification
  static String? dateRangeValidatorForStart(
      String? startDate, String? endDate) {
    // check if start date is empty
    if (startDate == null || startDate.isEmpty) {
      return 'La date de début ne peut pas être vide';
    }
    // check if start date is before today
    if (startDate.isNotEmpty &&
        DateFormat('dd-MM-yyyy HH:mm')
                .parse(startDate)
                .compareTo(DateTime.now()) <
            0) {
      return 'La date de début ne peut pas être antérieure à aujourd\'hui';
    }
    // check if start date is before end date
    if (startDate.isNotEmpty &&
        endDate != null &&
        endDate.isNotEmpty &&
        startDate.compareTo(endDate) > 0) {
      return 'La date de début doit être avant la date de fin';
    }
    return null;
  }

  static String? dateRangeValidatorForEnd(String? startDate, String? endDate) {
    // check if start date is before end date
    if (startDate != null &&
        startDate.isNotEmpty &&
        endDate != null &&
        endDate.isNotEmpty &&
        startDate.compareTo(endDate) > 0) {
      return 'La date de début doit être avant la date de fin';
    }
    return null;
  }
}
