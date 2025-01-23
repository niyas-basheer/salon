part of 'our_services_bloc.dart';

@immutable
abstract class OurServicesEvent extends Equatable {}

class GetOurServices extends OurServicesEvent {
  @override
  List<Object?> get props => [];
}

class ToggleServiceEvent extends OurServicesEvent {
  final dynamic data;

  ToggleServiceEvent({required this.data});

  @override
  List<Object?> get props => [data];
}

class SelectSubServiceEvent extends OurServicesEvent {
  final dynamic data;

  SelectSubServiceEvent({required this.data});

  @override
  List<Object?> get props => [data];
}
