import 'package:canarytemplate/data/model/response/burung_semua_tersedia_model.dart';

sealed class GetburungtersediaState {}

final class GetBurungTersediaInitial extends GetburungtersediaState {}

final class GetBurungTersediaLoading extends GetburungtersediaState {}

final class GetBurungTersediaLoaded extends GetburungtersediaState {
  final BurungSemuaTersediaModel burungTersedia;
  GetBurungTersediaLoaded({required this.burungTersedia});
}

final class GetBurungTersediaError extends GetburungtersediaState {
  final String message;
  GetBurungTersediaError({required this.message});
}
