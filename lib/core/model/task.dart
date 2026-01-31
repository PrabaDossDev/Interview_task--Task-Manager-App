

class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final String createdAt;
  final String updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'status': status,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    status: map['status'],
    createdAt: map['createdAt'],
    updatedAt: map['updatedAt'],
  );
}



