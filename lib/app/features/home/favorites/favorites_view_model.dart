import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'favorites_view_model.g.dart';

class FavoritesViewModel = FavoritesViewModelBase with _$FavoritesViewModel;

abstract class FavoritesViewModelBase extends AppBaseViewModel with Store {

}