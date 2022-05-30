abstract class UserRepository{
  Future getUserData(int id,);
}

class UserFakeDataRepository extends UserRepository{
  final List users = [
    <String, dynamic>{
    "id": 1,
    "firstName": "Mahmoud",
    "lastName": "Mourad",
    "phoneNumber": "+905537939551",
    "birthdate": "29-09-1998",
    },
    <String, dynamic>{
      "id": 2,
      "firstName": "Mahmut",
      "lastName": "Murat",
      "phoneNumber": "+905537939551",
      "birthdate": "29-09-1998",
    },
  ];
  @override
  Future getUserData(int id) async{
    List? result = null;
    await Future.delayed(
      const Duration(seconds: 2,),
          (){},
    ).then(
      (value) {
        result = users.where((element) => (element as Map)['id'] == id).toList();
      }
    );
    if(result != null ){
      return result!.first;
    }
    else{
      return null;
    }
  }

}