import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:salon_app/data/services_list_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'our_services_event.dart';

part 'our_services_state.dart';

class OurServicesBloc extends Bloc<OurServicesEvent, OurServicesState> {
  OurServicesBloc() : super(OurServicesInitial()) {
    on<GetOurServices>(_getOurService);
    on<ToggleServiceEvent>(_toggleService);
    on<SelectSubServiceEvent>(_selectSubService);
    add(GetOurServices());
  }

  FutureOr<void> _getOurService(
      GetOurServices event, Emitter<OurServicesState> emit) {
    try {
      emit(OurServicesLoading());

      emit(const OurServicesLoaded(data: ServiceListData.list));
    } catch (e, t) {
      print(e);
      print(t);
      emit(OurServicesFailed(e.toString()));
    }
  }

  FutureOr<void> _toggleService(
      ToggleServiceEvent event, Emitter<OurServicesState> emit) {
    if (state is OurServicesLoaded) {
      final cast = state as OurServicesLoaded;

      dynamic serviceData = cast.data.singleWhere(
        (element) => element['id'] == event.data['id'],
        orElse: () => dynamic,
      );

      emit(OurServicesLoaded(
          data: cast.data,
          selected: event.data,
          subServices:
              serviceData['id'] != null ? serviceData['sub_services'] : [],
          selectedSubServices: cast.selectedSubServices ));
    }
  }

  FutureOr<void> _selectSubService(
      SelectSubServiceEvent event, Emitter<OurServicesState> emit) {
    if (state is OurServicesLoaded) {
      final cast = state as OurServicesLoaded;

      List<dynamic> serviceList =
          List.from(cast.selectedSubServices ?? []).toList();

      // Check if the service is already in the list
      if (serviceList.map((e) => e['id']).contains(event.data['id'])) {
        // If found, remove it
        serviceList.remove(event.data);
      } else {
        // If not found, add it
        serviceList.add(event.data);
      }

      emit(OurServicesLoaded(
          data: cast.data,
          selected: cast.selected,
          subServices: cast.subServices,
          selectedSubServices: serviceList));
    }
  }
}
