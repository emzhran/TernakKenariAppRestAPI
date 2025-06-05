import 'package:canarytemplate/data/repository/profile_buyer_repository.dart';
import 'package:canarytemplate/presentation/buyer/profile/bloc/profile_buyer_event.dart';
import 'package:canarytemplate/presentation/buyer/profile/bloc/profile_buyer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  final ProfileBuyerRepository profileBuyerRepository;
  ProfileBuyerBloc({required this.profileBuyerRepository})
    : super(ProfilBuyerInitial()) {
    on<AddProfileBuyer>(_addProfileBuyer);
    on<GetProfileBuyerEvent>(_getProfileBuyer);
  }

  Future<void> _addProfileBuyer(
    AddProfileBuyer event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.addProfileBuyer(
      event.requestModel,
    );
    result.fold((error) => emit(ProfileBuyerError(message: error)), (profile) {
      emit(ProfileBuyerAdded(profile: profile));
    });
  }

  Future<void> _getProfileBuyer(
    GetProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.getProfileBuyer();
    result.fold(
      (error) => emit(ProfileBuyerError(message: error)),
      (profile) => emit(ProfileBuyerLoaded(profile: profile)),
    );
  }
}
