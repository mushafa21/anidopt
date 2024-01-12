import 'package:anidopt/model/pet_doctor_model.dart';
import 'package:anidopt/model/pet_shelter_model.dart';
import 'package:anidopt/presentation/widgets/network_image_view.dart';
import 'package:anidopt/ui/type.dart';
import 'package:flutter/material.dart';

class PetDoctorItem extends StatelessWidget {
  final PetDoctorModel petDoctorModel;
  const PetDoctorItem({Key? key, required this.petDoctorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: NetworkImageView(url: petDoctorModel.imageUrl ?? "",width: 60,height: 60,fit: BoxFit.cover,),
        title: Text(petDoctorModel.name ?? "",style: sMedium,),
        subtitle: Text(petDoctorModel.address ?? "",style: xxsRegular,),
      ),
    );
  }
}
