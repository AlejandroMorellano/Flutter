import 'package:bloc/bloc.dart';
import '../../data/models/work_model.dart';
import '../../data/repository/work_repository.dart';
import 'work_state.dart';

class workCubit extends Cubit<workstate> {
  final WorkRepository workRepository;

  workCubit({required this.workRepository}) : super(workInitial());


  Future<void> createWork(WorkModel work) async {
    try {
      emit(WorkLoading());
      await workRepository.createWork(work);
      final works = await workRepository.getAllWorks();
      emit(WorkSuccess(works: works));
    } catch (e) {
      emit(WorkError(message: e.toString()));
    }
  }

  Future<void> getWork(String id) async {
    try {
      emit(WorkLoading());
      final work = await workRepository.getWork(id);
      emit(WorkSuccess(works: [work]));
    } catch (e) {
      emit(WorkError(message: e.toString()));
    }
  }

  Future<void> updateWork(WorkModel work) async {
    try {
      emit(WorkLoading());
      await workRepository.updateWork(work);
      final works = await workRepository.getAllWorks();
      emit(WorkSuccess(works: works));
    } catch (e) {
      emit(WorkError(message: e.toString()));
    }
  }

  Future<void> deleteWork(String id) async {
    try {
      emit(WorkLoading());
      await workRepository.deleteWork(id);
      final works = await workRepository.getAllWorks();
      emit(WorkSuccess(works: works));
    } catch (e) {
      emit(WorkError(message: e.toString()));
    }
  }

  Future<void> fetchAllWorks() async {
    try {
      emit(WorkLoading());
      final works = await workRepository.getAllWorks();
      emit(WorkSuccess(works: works));
    } catch (e) {
      emit(WorkError(message: e.toString()));
    }
  }
}
