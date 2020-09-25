import 'package:crimemap/bloc/profile_cubit/profile_cubit.dart';
import 'package:crimemap/widgets/profile_heading.dart';
import 'package:crimemap/widgets/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() {
    context.bloc<ProfileCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFailure) {
            return Center(
              child: Text("Ops terjadi kesalahan"),
            );
          }

          if (state is ProfileLoaded) {
            return Stack(
              children: [
                //background
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 350.0),
                  color: Colors.white,
                  child: ProfileList(
                    icon1: Icons.supervisor_account,
                    text1: state.data.nama,
                    icon2: Icons.local_phone,
                    text2: state.data.noTelp,
                    icon3: Icons.wc,
                    text3: state.data.jenisKelamin,
                    icon4: Icons.home,
                    text4: state.data.alamat,
                    icon5: Icons.check,
                    text5: 'Simpan',
                    icon6: Icons.arrow_forward,
                    text6: 'Logout',
                  ),
                ),
                //heading
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
                //profileheading
                ProfileHeading(
                  imageURL: state.data.fotoProfile,
                  nama: state.data.nama,
                  email: state.data.email,
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
