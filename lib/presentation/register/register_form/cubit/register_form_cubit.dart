import 'package:anidopt/config/locator.dart';
import 'package:anidopt/model/user_model.dart';
import 'package:anidopt/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../config/cache_store.dart';

part 'register_form_state.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  final UserRepository _userRepository = UserRepository();
  final CacheStore _cacheStore = locator.get();
  RegisterFormCubit() : super(RegisterFormStateInitial());

  addUser(UserModel userModel) async{
    emit(RegisterFormStateLoading());
    try{
      await _userRepository.addUser(userModel);
      _cacheStore.user = userModel;
      emit(RegisterFormStateSuccess());
    }catch(e){
      emit(RegisterFormStateError(e.toString()));
    }
  }
}
