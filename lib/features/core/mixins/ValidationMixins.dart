mixin ValidationMixins{
  String? generalValidation( String? value ){
    if( value == null){
      return null;
    }
    else if(value.isEmpty){
      return 'Field should not be empty';
    }
    return null;
  }
}