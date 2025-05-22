import 'package:fides/domain/entities/loyalty_program_entity.dart';
import 'package:flutter/material.dart';

mixin ValidationMixins{

  /// Combines a list of [FormFieldValidator<T>] functions into a single validator.
  ///
  /// This is a generic version that works with any type `T` — not just `String`.
  /// It's especially useful for validating fields like:
  /// - Dropdowns (`DropdownButtonFormField<T>`)
  /// - Checkboxes (`FormField<bool>`)
  /// - Custom form inputs
  ///
  /// Each validator is called in sequence. The first non-null result (error message)
  /// is returned. If all validators pass, `null` is returned.
  ///
  /// Example:
  /// ```dart
  /// validator: composeValidators<String>([
  ///   generalValidation,
  ///   emailValidation,
  /// ])
  ///
  /// validator: composeValidators<MyEnum>([
  ///   (value) => value == null ? 'Please select a value' : null,
  /// ])
  /// ```
  FormFieldValidator<T> composeValidators<T>(List<FormFieldValidator<T>> validators) {
    return (value) {
      // Loop through each validator in the list
      for (final validator in validators) {
        // Apply the validator to the current value
        final result = validator(value);

        // If it returns a non-null string, that means validation failed.
        // We immediately return that error message and stop checking further.
        if (result != null) return result;
      }
      // If none of the validators returned an error, validation passed.
      return null;
    };
  }

  String? requiredField( String? value ){
    if( value == null){
      return 'Field required';
    }
    else if(value.isEmpty){
      return 'Field should not be empty';
    }
    return null;
  }

  String? validateDropdown<T>( T? value ){
    if( value == null){
      return 'Field required';
    }
    else if(value is String && value.isEmpty){
      return 'Field should not be empty';
    }
    return null;
  }

  String? validateDiscountAmount( String? value ){
    if( value == null){
      return 'Field required';
    }
    else if(value.isEmpty){
      return 'Field should not be empty';
    }
    return null;
  }

  String? emailValidation(String? value){
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value?.isNotEmpty ?? false) {
      if (!emailRegex.hasMatch(value!)) {
        return 'Invalid email';
      }
    }
    return null;
  }
}