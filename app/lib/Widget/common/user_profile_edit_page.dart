import 'dart:io';

import 'package:app/Widget/common/profile_form_field.dart';
import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Service/fireabse_service.dart';

class UserProfileEditPage extends StatefulWidget {
  final Customer customer;
  static const routeName = '/userProfileEditPage';

  const UserProfileEditPage({required this.customer, Key? key})
      : super(key: key);

  @override
  _UserProfileEditPageState createState() => _UserProfileEditPageState();
}

class _UserProfileEditPageState extends State<UserProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String? imageUrl;

  void uploadPhotoHandler() async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      setState(() {
        _imageFile = File(pickedFile.path);
        // photoController.text = _imageFile.path;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }
    Future<String> getImage(String? imageName) async {
    String imageUrl = await FirebaseService.loadImage(
        imageName.toString().substring(8), 'brokers');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

  Map<String, dynamic> _userData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  Customer _customer = Customer(
                      customerId: widget.customer.customerId,
                      deals: widget.customer.deals,
                      delivery: widget.customer.delivery,
                      isFavorite: widget.customer.isFavorite,
                      reviews: widget.customer.reviews,
                      user: User(
                          fullName: _userData['fullName'],
                          email: _userData['email'],
                          phone: _userData['phone'],
                          city: _userData['city'],
                          subCity: _userData['subCity'],
                          kebele: _userData['kebele'],
                          buys: widget.customer.user!.buys,
                          password: widget.customer.user!.password,
                          picture: _imageFile != null
                              ? _imageFile!.path
                              : widget.customer.user!.picture,
                          role: widget.customer.user!.role,
                          sex: widget.customer.user!.sex,
                          userId: widget.customer.user!.userId));
                  BlocProvider.of<CustomerBloc>(context)
                      .add(UpdateCustomerEvent(_customer, _imageFile != null));
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                LocaleKeys.done_btn_label_text.tr(),
                style: TextStyle(color: primaryColor, fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _imageFile == null
                    ? GestureDetector(
                        onTap: uploadPhotoHandler,
                        child: FutureBuilder(
                      future: getImage(widget.customer.user!.picture),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Text('none');
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              children: [
                                Text("Future builder"),
                                Center(
                                    child: SpinKitCircle(
                                  color: primaryColor,
                                )),
                              ],
                            ));
                          case ConnectionState.active:
                            return Text('');
                          case ConnectionState.done:
                            imageUrl = snapshot.data;
                            return CachedNetworkImage(
                              fit: BoxFit.fill,
                              height: 120.0,
                              width: 120.0,
                              imageUrl: snapshot.data,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                  child: SpinKitCircle(
                                color: primaryColor,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
                        }
                      }
                      )
                      )
                    : GestureDetector(
                        onTap: uploadPhotoHandler,
                        child: Container(
                          width: 120,
                          height: 120.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(_imageFile!),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20.0,
                ),
                ProfileFormField(
                  initialValue: widget.customer.user!.fullName!,
                  name: LocaleKeys.fullname_label_text.tr(),
                  onSaved: (value) {
                    setState(() {
                      _userData['fullName'] = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return LocaleKeys.field_required_label_text.tr();
                    }
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.contact_detail_label_text.tr()),
                    ProfileFormField(
                      initialValue: widget.customer.user!.email!,
                      name: LocaleKeys.email_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userData['email'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.customer.user!.phone!,
                      name: LocaleKeys.phone_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userData['phone'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.customer.user!.city == null
                          ? LocaleKeys.city_name_label_text.tr()
                          : widget.customer.user!.city!,
                      name: LocaleKeys.city_form_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userData['city'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.customer.user!.subCity == null
                          ? LocaleKeys.subcity_name_label_text.tr()
                          : widget.customer.user!.subCity!,
                      name: LocaleKeys.subcity_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userData['subCity'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.customer.user!.kebele == null
                          ? LocaleKeys.kebele_label_text.tr()
                          : widget.customer.user!.kebele!,
                      name: LocaleKeys.kebele_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userData['kebele'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
