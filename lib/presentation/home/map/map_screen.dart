import 'dart:async';

import 'package:anidopt/config/constant/dummy.dart';
import 'package:anidopt/config/enum/map_filter.dart';
import 'package:anidopt/presentation/home/map/cubit/map_cubit.dart';
import 'package:anidopt/presentation/pet_doctor/widget/pet_doctor_item.dart';
import 'package:anidopt/presentation/pet_shelter/widget/pet_shelter_item.dart';
import 'package:anidopt/presentation/widgets/horizontal_list_view.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../model/post_model.dart';
import '../../../utility/picker/location_picker.dart';
import '../../post/widget/post_item.dart';


@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapCubit _cubit;
  GoogleMapController? _controller;



  double? latitude;
  double? longitude;

  getInitialLocation() async {
    final location = await getCurrentLocation();
    latitude = location?.latitude;
    longitude = location?.longitude;
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitude ?? 0, longitude ?? 0), zoom: 14)));
  }

  @override
  void initState() {
    super.initState();
    getInitialLocation();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: Builder(
        builder: (context) {
          _cubit = context.read();
          return Scaffold(
            body: Column(
              children: [
                Expanded(child: _googleMap()),
                _bottomSheet()

              ],
            ),
          );
        }
      ),
    );
  }


  Widget _googleMap() {
    return BlocBuilder<MapCubit, MapState>(
  builder: (context, state) {
    return GoogleMap(
      markers: _cubit.markerList,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      initialCameraPosition: CameraPosition(
          target: LatLng(latitude ?? 0, longitude ?? 0), zoom: 14),
    );
  },
);
  }

  Widget _bottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.getScreenMargin(), vertical: spacing5),
      decoration: BoxDecoration(
          color: whiteColor
      ),
      height: 325,
      child: Column(
        children: [
          Text("Lihat Sekitar", style: mMedium,),
          SizedBox(height: spacing4,),
          _filterItems(),
          Expanded(child: _nearbyItems())


        ],
      ),
    );
  }


  Widget _filterItems(){
    return BlocBuilder<MapCubit, MapState>(
  builder: (context, state) {
    return HorizontalListView(itemCount: MapFilter.values.length, itemBuilder: (context,index){
      return _mapFilterItem(MapFilter.values[index]);
    });
  },
);
  }

  Widget _mapFilterItem(MapFilter mapFilter){
    return GestureDetector(
      onTap: (){
        _cubit.filterMap(mapFilter);
      },
      child: Container(
        margin: EdgeInsets.only(right: spacing4),
        padding: EdgeInsets.symmetric(horizontal: spacing4,vertical: spacing3),
        decoration: BoxDecoration(
          color: mapFilter == _cubit.selectedMapFilter ? primaryColor : null,
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(radiusS)
        ),
        child: Text(mapFilter.label ,style: sMedium.copyWith(color: mapFilter == _cubit.selectedMapFilter ? whiteColor : primaryColor),),
      ),
    );

  }
  Widget _nearbyItems() {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        switch(_cubit.selectedMapFilter){
          case MapFilter.post: {
            return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(stream: _cubit.getPostStream(), builder: (context,snapshot){
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              List<PostModel> listPost = snapshot.data!.docs.map((document) {
                return PostModel.fromJson(document.data());
              }).toList();
              return ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: listPost.length,
                  itemBuilder: (context, index) {
                    return PostItem(postModel: listPost[index]);
                  });
            });
          }
          case MapFilter.petShelter: {
            return ListView.builder(itemBuilder: (context,index){
              return PetShelterItem(petShelterModel: petShelterList[index]);
            },itemCount: petShelterList.length,shrinkWrap: true,);
          }
          case MapFilter.petDoctor:  {
            return ListView.builder(itemBuilder: (context,index){
              return PetDoctorItem(petDoctorModel: petDoctorList[index]);
            },itemCount: petDoctorList.length,shrinkWrap: true,);
          }
        }
      },
    );
  }


}
