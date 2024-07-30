import 'package:equatable/equatable.dart';
import '../../data/models/work_model.dart';

abstract class WorkState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkSuccess extends WorkState {
  final List<WorkModel> works;

  WorkSuccess({required this.works});

  @override
  List<Object?> get props => [works];
}

class WorkError extends WorkState {
  final String message;

  WorkError({required this.message});

  @override
  List<Object?> get props => [message];
}
