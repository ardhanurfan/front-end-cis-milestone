import 'package:cis/models/data_model.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class ShowDataPage extends StatelessWidget {
  const ShowDataPage({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 24),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Show Data',
              textAlign: TextAlign.center,
              style:
                  whiteTextStyle.copyWith(fontSize: 28, fontWeight: semibold),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(top: 40, bottom: 40),
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  Text(
                    data.fullName,
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'NIK',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  Text(
                    data.nik,
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Jenis Kelamin',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  Text(
                    data.gender,
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Alamat',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  Text(
                    data.address,
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Status Pernikahan',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  Text(
                    data.statusPernikahan,
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
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
                  'Back to Home',
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
