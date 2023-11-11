
import 'package:equatable/equatable.dart';

class Model extends Equatable{
  Model();
  factory Model.fromJson(Map<String, dynamic> json) => Model();
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
  
  @override
  List<Object?> get props => [];
}
