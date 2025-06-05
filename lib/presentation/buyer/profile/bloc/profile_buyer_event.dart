import 'package:canarytemplate/data/model/request/buyer/buyer_profile_request_model.dart';

sealed class ProfileBuyerEvent {}

class AddProfileBuyer extends ProfileBuyerEvent {
  final Buyerprofilerequestmodel requestModel;

  AddProfileBuyer({required this.requestModel});
}

class GetProfileBuyerEvent extends ProfileBuyerEvent {}