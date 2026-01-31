import 'base_model.dart';

class StatusModel extends BaseModel {
  final String status;
  final String label;

   StatusModel({
    required this.status,
    required this.label,
  });

  @override
  Map<String, dynamic> toJson() => {
    "status": status,
    "label": label,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StatusModel && other.status == status;

  @override
  int get hashCode => status.hashCode;
}

