part of 'map_cubit.dart';

sealed class MapState {}

class MapStateInitial extends MapState {}

class MapStateFilter extends MapState {
  final MapFilter mapFilter;
  MapStateFilter(this.mapFilter);
}

