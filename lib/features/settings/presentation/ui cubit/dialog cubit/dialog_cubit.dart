import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogInitial());
  bool isQrCodeShwowed = false;

  void toggleQrCode() {
    isQrCodeShwowed = !isQrCodeShwowed;
    emit(DialogChanged());
  }
}
