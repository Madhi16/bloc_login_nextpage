import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();
}

class listDetails extends ListEvent{
  listDetails();

  @override
  List<Object?> get props => [];

}