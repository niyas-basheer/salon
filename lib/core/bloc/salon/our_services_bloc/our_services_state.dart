part of 'our_services_bloc.dart';

abstract class OurServicesState extends Equatable {
  const OurServicesState();
}

class OurServicesInitial extends OurServicesState {
  @override
  List<Object> get props => [];
}

class OurServicesLoading extends OurServicesState {
  @override
  List<Object> get props => [];
}

class OurServicesLoaded extends OurServicesState {
  final List<dynamic> data;
  final dynamic selected;
  final List<dynamic>? subServices;
  final List<dynamic>? selectedSubServices;

  const OurServicesLoaded({required this.data, this.selected, this.subServices, this.selectedSubServices});

  @override
  List<Object?> get props => [data, selected, subServices, selectedSubServices];
}

class OurServicesFailed extends OurServicesState {
  final String error;

  const OurServicesFailed(this.error);

  @override
  List<Object> get props => [error];
}
