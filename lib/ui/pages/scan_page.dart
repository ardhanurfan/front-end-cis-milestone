import 'dart:async';
import 'dart:math';

import 'package:cis/cubit/data_cubit.dart';
import 'package:cis/cubit/features_cubit.dart';
import 'package:cis/models/data_model.dart';
import 'package:cis/ui/pages/fill_form.dart';
import 'package:cis/ui/pages/show_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../shared/theme.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background.png'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 220,
            margin: const EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/scan_image.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 100),
          BlocConsumer<DataCubit, DataState>(
            listener: (context, state) {
              if (state is DataSuccess) {
                if (state.data.nik != 'null') {
                  int index = context.read<FeaturesCubit>().state;
                  Timer(
                    const Duration(seconds: 3),
                    () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowDataPage(data: state.data)));
                          break;
                        case 1:
                          Navigator.pushNamed(context, '/validate');
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FillForm(data: state.data)));
                          break;
                        case 3:
                          Navigator.pushNamed(context, '/coming');
                          break;
                        default:
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'home', (route) => false);
                      }
                    },
                  );
                } else {
                  Navigator.pushNamed(context, '/failed');
                }
              } else if (state is DataFailed) {
                Navigator.pushNamed(context, '/failed');
              }
            },
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.black45,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 380,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 45, bottom: 24),
                              width: 130,
                              height: 130,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/put_card_icon.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Ready to Scan',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                            Text(
                              'Put Your E-KTP',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 28, fontWeight: semibold),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  // NIK FORM NFC CARD
                  num nik = 2002001 + Random().nextInt(8);

                  // Fetch Data
                  context.read<DataCubit>().getData(nik.toString());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 221,
                  height: 55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/button_background.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Text(
                    'Scan Now',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
