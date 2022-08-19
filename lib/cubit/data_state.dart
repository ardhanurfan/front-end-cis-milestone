part of 'data_cubit.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  const DataSuccess(this.data);

  final DataModel data;

  @override
  List<Object> get props => [data];
}

class DataFailed extends DataState {
  const DataFailed(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
