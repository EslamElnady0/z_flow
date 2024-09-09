import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_links_lists_state.dart';

class GetLinksListsCubit extends Cubit<GetLinksListsState> {
  GetLinksListsCubit() : super(GetLinksListsInitial());
}
