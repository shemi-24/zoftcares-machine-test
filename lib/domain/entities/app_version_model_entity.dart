import 'package:equatable/equatable.dart';

class AppVersionModelEntity extends Equatable{


  final String version;

  const AppVersionModelEntity({
    required this.version,
  });



  @override
  // TODO: implement props
  List<Object?> get props => [version];

}