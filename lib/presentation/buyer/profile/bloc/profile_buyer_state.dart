import 'package:canarytemplate/data/model/response/buyer/buyer_profile_response_model.dart';

sealed class ProfileBuyerState {}

final class ProfilBuyerInitial extends ProfileBuyerState {}

final class ProfileBuyerLoading extends ProfileBuyerState {}

final class ProfileBuyerLoaded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;

  ProfileBuyerLoaded({required this.profile});
}

final class ProfileBuyerError extends ProfileBuyerState {
  final String message;

  ProfileBuyerError({required this.message});
}

final class ProfileBuyerAdded extends ProfileBuyerState {
  final BuyerProfileResponseModel profile;

  ProfileBuyerAdded({required this.profile});
}

final class ProfileBuyerAddederror extends ProfileBuyerState {
  final String message;

  ProfileBuyerAddederror({required this.message});
}
