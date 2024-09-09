import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_links_list_state.dart';

class UpdateLinksListCubit extends Cubit<UpdateLinksListState> {
  UpdateLinksListCubit() : super(UpdateLinksListInitial());
}
