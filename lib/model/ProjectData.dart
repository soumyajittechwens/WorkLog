class ProjectData {
  int? projectId;
  String? projectName;
  String? clientName;

  ProjectData({
    this.projectId,
    this.projectName,
    this.clientName,
  });

  @override
  String toString() {
    return projectName ?? '';
  }

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      projectId: json['_id'],
      projectName: json['name'],
      clientName: json['client'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': projectId,
      'name': projectName,
      'client': clientName,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectData &&
        other.projectId == projectId &&
        other.projectName == projectName &&
        other.clientName == clientName;
  }

  @override
  int get hashCode =>
      projectId.hashCode ^ projectName.hashCode ^ clientName.hashCode;
}