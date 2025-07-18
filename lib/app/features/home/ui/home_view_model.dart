import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase extends AppBaseViewModel with Store {

}