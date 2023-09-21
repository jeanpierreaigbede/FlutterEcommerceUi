import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appColors.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Profile",
                style: GoogleFonts.inter(
                    color: AppColors.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 40,),
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
              ),
              const SizedBox(height: 10,),

              Text(
                "John Smalth",
                style: GoogleFonts.inter(
                    color: AppColors.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              ListTile(
                title: Text(
                    'My informations',
                  style: GoogleFonts.inter(
                    fontSize: 18
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              ),
              ListTile(
                title: Text(
                  'My favorites',
                  style: GoogleFonts.inter(
                      fontSize: 18
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              ),
              ListTile(
                title: Text(
                  'Orders',
                  style: GoogleFonts.inter(
                      fontSize: 18
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              ),
              ListTile(
                title: Text(
                  'Notifcations',
                  style: GoogleFonts.inter(
                      fontSize: 18
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              ),
              ListTile(
                title: Text(
                  'Setting',
                  style: GoogleFonts.inter(
                      fontSize: 18
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              ),
              const SizedBox(height: 10,),
              ListTile(
                title: Text(
                  'Log out',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                trailing: const Icon(Icons.logout,size: 17,color: AppColors.mainColor,),
              ),
            ],
          ),
        ),
      )
    );
  }
}
