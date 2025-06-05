import 'package:canarytemplate/data/model/request/auth/register_request_model.dart';

sealed class RegisterEvent {}

class RegisterRequested extends RegisterEvent {
  final Registerrequestmodel requestedModel;

  RegisterRequested({required this.requestedModel});
}
