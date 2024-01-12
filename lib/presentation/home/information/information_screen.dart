import 'package:anidopt/presentation/article/widget/article_item.dart';
import 'package:anidopt/presentation/pet_doctor/widget/pet_doctor_item.dart';
import 'package:anidopt/presentation/widgets/horizontal_list_view.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../config/constant/dummy.dart';
import '../../pet_shelter/widget/pet_shelter_item.dart';

@RoutePage()
class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.getScreenMargin(),
                vertical: context.getScreenMargin()),
            child: Column(
              children: [
                _articleList(),
                SizedBox(height: spacing5,),
                _petShelterList(),
                SizedBox(height: spacing5,),
                _petDoctorList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _articleList() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Artikel",
              style: mMedium,
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("Lihat Semua"))
          ],
        ),
        SizedBox(height: spacing4,),
        HorizontalListView(
          itemBuilder: (context, index) {
            return ArticleItem(articleModel: articleList[index]);
          },
          itemCount: articleList.length,
        )
      ],
    );
  }

  Widget _petDoctorList() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Dokter Hewan",
              style: mMedium,
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("Lihat Semua"))
          ],
        ),
        SizedBox(height: spacing4,),
        ListView.builder(
          itemBuilder: (context, index) {
            return PetDoctorItem(petDoctorModel: petDoctorList[index]);
          },
          physics: NeverScrollableScrollPhysics(),
          itemCount: petDoctorList.length,
          shrinkWrap: true,
        )
      ],
    );
  }

  Widget _petShelterList() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Shelter Hewan",
              style: mMedium,
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("Lihat Semua"))
          ],
        ),
        SizedBox(height: spacing4,),
        ListView.builder(
          itemBuilder: (context, index) {
            return PetShelterItem(petShelterModel: petShelterList[index]);
          },
          physics: NeverScrollableScrollPhysics(),
          itemCount: petShelterList.length,
          shrinkWrap: true,
        )
      ],
    );
  }
}
