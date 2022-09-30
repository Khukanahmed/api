import 'package:http/http.dart' as http;
import 'package:appsapi/model/Dataapi.dart';

class datehelper {
  Future <List<Productdata>?> getProductdata()async{

    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var json = response.body;
      return productdataFromJson(json);
      
    }
  }
  
}