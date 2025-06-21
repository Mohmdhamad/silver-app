import 'package:tasks/models/data.dart';

class AppStates{}
class InitialState extends AppStates{}
class LoadingData extends AppStates{}
class GetDataSuccessfully extends AppStates{
  final List<DataModel>products;
  GetDataSuccessfully(this.products);
}
class ErrorLoadingData extends AppStates{
  final String error ;
  ErrorLoadingData(this.error);
}