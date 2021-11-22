import 'dart:io';
import 'package:app/Widget/common/profile_form_field.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/model/broker/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

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
                          picture: widget.broker.user!.picture,
                          role: widget.broker.user!.role,
                          sex: widget.broker.user!.sex,
                          userId: widget.broker.user!.userId,
                        ));
                    BlocProvider.of<BrokerBloc>(context).add(
                      UpdateBrokerEvent(
                        _broker,
                        widget.broker.approved!,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  "Done",
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
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Ip.ip}/api/users/get/?fileName=${widget.broker.user!.picture as String}",
                          imageBuilder: (context, imageProvider) => Container(
                            width: 120,
                            height: 120.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => Center(
                            child: SpinKitCircle(),
                          ),
                          errorWidget: (context, url, _) => Icon(Icons.error),
                        ),
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
                  initialValue: widget.broker.user!.fullName!,
                  name: "Full Name",
                  onSaved: (value) {
                    setState(() {
                      _userObject['fullName'] = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field required";
                    }
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Details"),
                    ProfileFormField(
                      initialValue: widget.broker.user!.email!,
                      name: "Email",
                      onSaved: (value) {
                        setState(() {
                          _userObject['email'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field required";
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.phone!,
                      name: "Phone",
                      onSaved: (value) {
                        setState(() {
                          _userObject['phone'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field required";
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.city == null
                          ? "City Name"
                          : widget.broker.user!.city!,
                      name: "City",
                      onSaved: (value) {
                        setState(() {
                          _userObject['city'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field required";
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.subCity == null
                          ? "Sub city name"
                          : widget.broker.user!.subCity!,
                      name: "Sub city",
                      onSaved: (value) {
                        setState(() {
                          _userObject['subCity'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field required";
                        }
                      },
                    ),
                    ProfileFormField(
                      initialValue: widget.broker.user!.kebele == null
                          ? "Kebele"
                          : widget.broker.user!.kebele!,
                      name: "Kebele",
                      onSaved: (value) {
                        setState(() {
                          _userObject['kebele'] = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field required";
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
