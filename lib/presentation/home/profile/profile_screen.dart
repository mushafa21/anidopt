import 'package:anidopt/config/cache_store.dart';
import 'package:anidopt/config/locator.dart';
import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/presentation/widgets/circle_image_view.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final CacheStore _cacheStore = locator.get();

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    final user = locator.get<CacheStore>().user;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
        child: Column(
          children: [


            Row(
              children: [
                CircleImageView(url: "",radius: 30 ,),
                SizedBox(width: spacing4,),
                Text(user.name ?? "",style: sRegular,)
              ],
            ),
            SizedBox(height: spacing5,),


            GestureDetector(
              onTap: (){
                context.router.push(ReportListRoute());

              },
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.triangleExclamation),
                title : Text("Laporanku"),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
            ),
            SizedBox(height: spacing4),


            OutlinedButton(onPressed: (){
              _cacheStore.clearCache();
              context.router.replaceAll([LoginRoute()]);
            }, child: Text("Logout"))
          ],
        ),
      )),
    );
  }
}
