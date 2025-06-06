import 'package:canarytemplate/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:canarytemplate/presentation/bloc/get_all_burung_tersedia/bloc/getburungtersedia_event.dart';
import 'package:canarytemplate/presentation/bloc/get_all_burung_tersedia/bloc/getburungtersedia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetburungtersediaBloc
    extends Bloc<GetBurungTersediaEvent, GetburungtersediaState> {
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository;

  GetburungtersediaBloc(this.getAllBurungTersediaRepository)
    : super(GetBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>(_getAllBurungTersedia);
  }

  Future<void> _getAllBurungTersedia(
    GetAllBurungTersediaEvent event,
    Emitter<GetburungtersediaState> emit,
  ) async {
    emit(GetBurungTersediaLoading());
    final result = await getAllBurungTersediaRepository.getAllBurungTersedia();
    result.fold(
      (error) => emit(GetBurungTersediaError(message: error)),
      (burungTersedia) =>
          emit(GetBurungTersediaLoaded(burungTersedia: burungTersedia)),
    );
  }
}
