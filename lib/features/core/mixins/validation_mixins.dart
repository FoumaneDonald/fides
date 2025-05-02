mixin ValidationMixins{
  String? generalValidation( String? value ){
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
    if(value == null){
      return 'Field required';
    }else if (!emailRegex.hasMatch(value)){
      return 'Invalid email';
    }
    return null;
  }
}