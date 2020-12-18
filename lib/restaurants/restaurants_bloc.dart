import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:tostada_regia/models/restaurant.dart';
import 'package:tostada_regia/models/session_manager.dart';
import 'package:tostada_regia/network/rest_data_source.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:location/location.dart';
part 'restaurants_event.dart';

part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsLoadInProgress());
  final logger = Logger();
  var latitude = 0.0;
  var longitude = 0.0;

  @override
  Stream<RestaurantsState> mapEventToState(RestaurantsEvent event) async* {

    if (event is FetchRestaurantsEvent) {
      yield RestaurantsLoadInProgress();

      await SessionManager.instance.restoreCustomer();
      await SessionManager.instance.restoreCreditCard();

      if(SessionManager.instance.currentRestaurant == null){
        var restDataSource = new RestDataSource();
        await _setupLocationData();
        final list = await restDataSource
            .fetch("Restaurant?latitude=$latitude&longitude=$longitude");
        SessionManager.instance.restaurants =
            list.map((model) => Restaurant.fromJson(model)).toList();

        SessionManager.instance.currentRestaurant = _getDefaultRestaurant(SessionManager.instance.restaurants);

        logger.d(
            "currentRestaurant != null ${SessionManager.instance.currentRestaurant.toJson()}");


      }

      yield RestaurantsLoadSuccess();
    }

  }

  _getDefaultRestaurant(List<Restaurant> restaurants){
    for (var restaurant in restaurants) {

      if (restaurant.isOpen) {
        return restaurant;
      }
    }
  }

  _setupLocationData() async {
    if (kIsWeb) {
      return;
    }

    try{
      Location location = new Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();

      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();

      if (_locationData != null) {
        latitude = _locationData.latitude;
        longitude = _locationData.longitude;
      }
    }catch(e){
      logger.e(e);
    }

  }
}
