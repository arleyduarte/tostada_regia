


bool isNotNullOrEmpty(String string){
  if(string == null){
    return false;
  }

  if(string.isNotEmpty){
    return true;
  }


}


bool isNullOrEmpty(String string){
  if(string == null){
    return true;
  }

  if(string.isEmpty){
    return true;
  }

  return false;


}