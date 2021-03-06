import 'dart:async';
import 'dart:io';

import 'package:crimemap/shared/sizeconfig.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:crimemap/widgets/text_input.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';

class FormLaporanPage extends StatefulWidget {
  static final routName = '/form_laporan';

  @override
  State<StatefulWidget> createState() {
    return _FormLaporanPageState();
  }
}

class _FormLaporanPageState extends State<FormLaporanPage> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    TextEditingController nomertelponController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController keteranganController = TextEditingController();
    File _image;
    final picker = ImagePicker();

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(-6.130754, 106.856512),
      zoom: 11,
    );

    _imgFromCamera() async {
      final pickedFileFromCamera =
          await picker.getImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = File(pickedFileFromCamera.path);
      });
    }

    _imgFromGallery() async {
      final pickedFileFromGallery =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = File(pickedFileFromGallery.path);
      });
    }

    List<String> listKejahatan = [
      'curanmor',
      'Tawuran',
      'Curas',
      'Curat',
      'Begal',
    ];

    var kejahatan = 'Tawuran';

    print(_image);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pengaduan'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20.0),
        child: Container(
          width: SizeTheme.screenWidth,
          height: SizeTheme.screenHeight,
          color: whiteColor,
          child: ListView(
            children: [
              //jenis kejahatan
              SizedBox(height: 20),
              Text(
                'kejahatan',
              ),
              SizedBox(height: 10),
              DropDownField(
                value: kejahatan,
                required: true,
                labelText: 'Pilih Kejahatan',
                items: listKejahatan,
                strict: false,
                setter: (newValue) {
                  setState(() => kejahatan = newValue);
                },
              ),
              SizedBox(height: 20),
              //nomer telpon
              TextInputForm(
                controller: nomertelponController,
                hintText: 'nomer handphone',
                prefixIcon: Icon(Icons.local_phone),
              ),
              SizedBox(height: 20),
              //alamat
              TextInputForm(
                controller: alamatController,
                hintText: 'Alamat',
                prefixIcon: Icon(Icons.home),
              ),
              SizedBox(height: 20),
              //keterangan
              TextInputForm(
                controller: keteranganController,
                hintText: 'Keterangan',
                prefixIcon: Icon(Icons.info),
              ),
              SizedBox(height: 20),
              //widget foto
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _image != null
                      ? Container(
                          width: 100,
                          height: 100,
                          child: Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text('Tidak Ada Foto'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: _imgFromCamera,
                        child: Text(
                          'Pilih foto dari kamera',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      ),
                      FlatButton(
                        onPressed: _imgFromGallery,
                        child: Text(
                          'Pilih foto dari gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              //map
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(height: 50),
              //button
              Container(
                height: 60.0,
                child: RaisedButton(
                  child: Text(
                    'SIMPAN',
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
