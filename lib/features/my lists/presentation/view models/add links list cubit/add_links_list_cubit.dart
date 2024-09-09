import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_links_list_state.dart';

class AddLinksListCubit extends Cubit<AddLinksListState> {
  AddLinksListCubit() : super(AddLinksListInitial());
}
