import 'package:anidopt/model/pet_shelter_model.dart';
import 'package:anidopt/presentation/widgets/network_image_view.dart';
import 'package:anidopt/ui/type.dart';
import 'package:flutter/material.dart';

class PetShelterItem extends StatelessWidget {
  final PetShelterModel petShelterModel;
  const PetShelterItem({Key? key, required this.petShelterModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: NetworkImageView(url: petShelterModel.imageUrl ?? "",width: 60,height: 60,fit: BoxFit.cover,),
        title: Text(petShelterModel.name ?? "",style: sMedium,),
        subtitle: Text(petShelterModel.address ?? "",style: xxsRegular,),
      ),
    );
  }
}
