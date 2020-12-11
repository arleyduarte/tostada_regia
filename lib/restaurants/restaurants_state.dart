part of 'restaurants_bloc.dart';

@immutable
abstract class RestaurantsState  extends Equatable{
  const RestaurantsState();
  @override
  List<Object> get props => [];
}

class RestaurantsLoadInProgress extends RestaurantsState {}

class RestaurantsLoadSuccess extends RestaurantsState {}