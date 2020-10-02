import 'package:crimemap/bloc/auth_bloc/auth_bloc.dart';
import 'package:crimemap/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileList extends StatelessWidget {
  final IconData icon1, icon2, icon3, icon4, icon5, icon6;
  final String text1, text2, text3, text4, text5, text6;

  ProfileList({
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.icon5,
    this.icon6,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //jeniskelamin
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  icon1,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                text1,
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          //
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  icon2,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 2 * 20.0 - 70.0,
                child: Text(
                  text2,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          //
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  icon3,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                text3,
              )
            ],
          ),

          SizedBox(
            height: 10.0,
          ),
          //
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    icon4,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  text4,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //logout
          InkWell(
            onTap: () {
              //
              context.bloc<AuthBloc>().add(AuthEventLoggedOut());
              //
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              print('logout');
            },
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    icon6,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  text6,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
