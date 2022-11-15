import 'dart:io';
import 'package:app/Widget/common/profile_form_field.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Service/fireabse_service.dart';

class BrokerProfileEditPage extends StatefulWidget {
  final Broker broker;

  const BrokerProfileEditPage({required this.broker, Key? key})
      : super(key: key);

  @override
  _BrokerProfileEditPageState createState() => _BrokerProfileEditPageState();
}

class _BrokerProfileEditPageState extends State<BrokerProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
    String? imageUrl;

     Future<String> getImage(String? imageName) async {
    String imageUrl = await FirebaseService.loadImage(
        imageName.toString().substring(8), 'brokers');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

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

  Map<String, dynamic> _userObject = {};

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
                    Broker _broker = Broker(
                        approved: widget.broker.approved,
                        brokerId: widget.broker.brokerId,
                        category: Category(
                            categoryId: widget.broker.category!.categoryId,
                            catigoryName: widget.broker.category!.catigoryName),
                        deals: widget.broker.deals,
                        delivery: widget.broker.delivery,
                        isFavorite: true,
                        portfolios: widget.broker.portfolios,
                        reviews: widget.broker.reviews,
                        skills: widget.broker.skills,
                        user: User(
                          buys: widget.broker.user!.buys,
                          fullName: _userObject['fullName'],
                          city: _userObject['city'],
                          subCity: _userObject['subCity'],
                          kebele: _userObject['kebele'],
                          email: _userObject['email'],
                          password: widget.broker.user!.password,
                          phone: _userObject['phone'],
                          picture:_imageFile != null ? _imageFile!.path: widget.broker.user!.picture,
                          role: widget.broker.user!.role,
                          sex: widget.broker.user!.sex,
                          userId: widget.broker.user!.userId,
                        ));
                    BlocProvider.of<BrokerBloc>(context).add(
                      UpdateBrokerProfileEvent(
                        _broker,
                        _imageFile != null,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  LocaleKeys.done_btn_label_text.tr(),
                  style: TextStyle(color: primaryColor, fontSize: 18.0),
                )),
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
                      future: getImage(widget.broker.user!.picture),
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
                              )
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
                        }
                      }
                      ))
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
                  initialValue: widget.broker.user!.fullName!,
                  name: LocaleKeys.fullname_label_text.tr(),
                  onSaved: (value) {
                    setState(() {
                      _userObject['fullName'] = value;
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
                      initialValue: widget.broker.user!.email!,
                      name: LocaleKeys.email_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userObject['email'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.phone!,
                      name: LocaleKeys.phone_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userObject['phone'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.city == null
                          ? LocaleKeys.city_name_label_text.tr()
                          : widget.broker.user!.city!,
                      name: LocaleKeys.city_form_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userObject['city'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.subCity == null
                          ? LocaleKeys.subcity_name_label_text.tr()
                          : widget.broker.user!.subCity!,
                      name: LocaleKeys.subcity_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userObject['subCity'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return LocaleKeys.field_required_label_text.tr();
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.kebele == null
                          ? LocaleKeys.kebele_label_text.tr()
                          : widget.broker.user!.kebele!,
                      name: LocaleKeys.kebele_label_text.tr(),
                      onSaved: (value) {
                        setState(() {
                          _userObject['kebele'] = value;
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
