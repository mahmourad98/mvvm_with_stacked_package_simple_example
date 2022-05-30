abstract class UserRepository{
  Future getUserData(int id,);
}

class UserFakeDataRepository extends UserRepository{
  @override
  Future getUserData(int id) async{
    if(id == 1){
      await Future.delayed(
        const Duration(seconds: 2,),
            (){},
      );
      return <String, dynamic>{
        "id": 1,
        "firstName": "Mahmoud",
        "lastName": "Mourad",
        "phoneNumber": "+905537939551",
        "birthdate": "29-09-1998",
      };
    }
    else{
      return null;
    }
  }

}