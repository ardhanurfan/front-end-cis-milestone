import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  const DataModel({
    required this.personId,
    required this.nik,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.statusPernikahan,
  });

  final String personId;
  final String nik;
  final String fullName;
  final String gender;
  final String address;
  final String statusPernikahan;

  @override
  List<Object?> get props =>
      [personId, nik, fullName, gender, address, statusPernikahan];
}
