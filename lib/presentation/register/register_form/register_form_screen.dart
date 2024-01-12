import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/model/user_model.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:anidopt/utility/location_util.dart';
import 'package:anidopt/utility/picker/location_picker.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_location_picker/flutter_map_location_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import '../../../ui/dimen.dart';
import 'cubit/register_form_cubit.dart';

@RoutePage()
class RegisterFormScreen extends StatelessWidget {
  final String uid;
  final String phoneNumber;

  RegisterFormScreen({super.key, required this.uid, required this.phoneNumber});

  late RegisterFormCubit _cubit;
  late AnidoptDialog _dialog;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormCubit(),
      child: Builder(builder: (context) {
        _cubit = context.read();
        _dialog = AnidoptDialog(context);
        return _buildMainView(context);
      }),
    );
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Pendaftaran",
          style: smMedium.copyWith(color: textColor),
        ),
      ),
      body: BlocListener<RegisterFormCubit, RegisterFormState>(
        listener: (context, state) {
          if (state is RegisterFormStateLoading) {
            _dialog.showLoading();
          } else if (state is RegisterFormStateSuccess) {
            _dialog.dismiss();
            context.router.replaceAll([HomeNavigationRoute()]);
          } else if (state is RegisterFormStateError) {
            _dialog.dismiss();
            _dialog.error(message: state.message);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.getScreenMargin(),
              vertical: context.getScreenMargin()),
          child: Column(
            children: [
              Text(
                "Lengkapi form dibawah untuk memulai menggunakan aplikasi Anidopt!",
                style: smMedium,
              ),
              RegisterForm(phone: phoneNumber, onSubmitted: (user) {
                _cubit.addUser(user);
              }, uid: uid,)
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final String phone;
  final String uid;

  final Function(UserModel) onSubmitted;

  const RegisterForm({Key? key, required this.phone, required this.onSubmitted, required this.uid})
      : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? address;
  double? latitude;
  double? longitude;

  getInitialLocation() async{
    final location = await getCurrentLocation();
    latitude = location?.latitude;
    longitude = location?.longitude;
    if(latitude != null && longitude != null){
      address = await getLocationName(latitude!, longitude!);
    }

    setState(() {
    });

  }
  pickLocation() async {
    print("PICK LOCATIOn");
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MapLocationPicker(
            initialLocation: latitude != null && longitude != null ? LatLng(latitude!, longitude!) : LatLng( -6.200000, 106.816666),
              onPicked: (result) {
            Navigator.pop(context);
            address = result.address;
            latitude = result.latitude;
            longitude = result.longitude;
            setState(() {});
          });
        });
  }

  @override
  void initState() {
    super.initState();
    getInitialLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.phone,
              enabled: false,
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(spacing3),
                    child: FaIcon(
                      FontAwesomeIcons.phone,
                      size: 14,
                    ),
                  ),
                  labelText: "Nomor Telepon",
                  prefixIconConstraints: BoxConstraints()),
            ),
            SizedBox(
              height: spacing5,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _nameController,
              validator: (value) {
                if (value?.isEmpty == true) {
                  return "Silahkan masukan nama lengkap";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(spacing3),
                    child: FaIcon(
                      FontAwesomeIcons.solidUser,
                      size: 14,
                    ),
                  ),
                  labelText: "Nama Lengkap",
                  prefixIconConstraints: BoxConstraints()),
            ),
            SizedBox(
              height: spacing5,
            ),
            GestureDetector(
              onTap: () {
                pickLocation();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing5,
                  vertical: spacing5,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: gray9Color),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      size: 14,
                    ),
                    SizedBox(
                      width: spacing3,
                    ),
                    Expanded(
                        child: Text(
                      address ?? "Pilih lokasi anda",
                      style: sRegular,
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spacing6,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      print(_formKey.currentState?.validate());
                      if (_formKey.currentState?.validate() == true) {
                        widget.onSubmitted(UserModel()..name = _nameController.text ..latitude = latitude ..longitude = longitude ..address = address ..uid = widget.uid ..phone = widget.phone);
                      }
                    },
                    child: Text("Daftar")))
          ],
        ));
  }
}
