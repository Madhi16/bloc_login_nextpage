
import 'package:equatable/equatable.dart';

import '../model/list_model.dart';

abstract class ListState extends Equatable {
  @override
  List<Object> get props => [];
  const ListState();
}

class ListInitial extends ListState {
  @override
  List<Object> get props => [];
}

class ListLoaded extends ListState {

}
class ListReady extends ListState{
  final List<Data>  data;
  ListReady({required this.data});
}
class ListError extends ListState {
  final String message;
  ListError({required this.message});
}