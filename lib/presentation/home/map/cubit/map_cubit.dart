import 'package:anidopt/config/enum/map_filter.dart';
import 'package:anidopt/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map_location_picker/flutter_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../config/constant/dummy.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final PostRepository _postRepository = PostRepository();
  MapFilter selectedMapFilter = MapFilter.post;
  Set<Marker> markerList = {};
  MapCubit() : super(MapStateInitial());

  Stream<QuerySnapshot<Map<String, dynamic>>>  getPostStream() {
    return _postRepository.getPostStream();
  }


  filterMap(MapFilter mapFilter){
    selectedMapFilter = mapFilter;
    markerList.clear();
    petShelterList.forEach((element) {
      markerList.add(Marker(markerId: MarkerId(element.address ?? ""),position: LatLng(element.latitude!, element.longitude!)));
    });
    emit(MapStateFilter(mapFilter));
  }
}
