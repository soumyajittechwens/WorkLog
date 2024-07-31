class ProjectIdWiseWorkLogsData {
  ProjectIdWiseWorkLogsData({
      String? message, 
      bool? status, 
      num? statusCode, 
      List<ProjectIdWiseDetailsData>? response,
      Additional? additional,}){
    _message = message;
    _status = status;
    _statusCode = statusCode;
    _response = response;
    _additional = additional;
}

  ProjectIdWiseWorkLogsData.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _statusCode = json['statusCode'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(ProjectIdWiseDetailsData.fromJson(v));
      });
    }
    _additional = json['additional'] != null ? Additional.fromJson(json['additional']) : null;
  }
  String? _message;
  bool? _status;
  num? _statusCode;
  List<ProjectIdWiseDetailsData>? _response;
  Additional? _additional;

  String? get message => _message;
  bool? get status => _status;
  num? get statusCode => _statusCode;
  List<ProjectIdWiseDetailsData>? get projectIdWiseDetailsData => _response;
  Additional? get additional => _additional;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['statusCode'] = _statusCode;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    if (_additional != null) {
      map['additional'] = _additional?.toJson();
    }
    return map;
  }

}

class Additional {
  Additional({
      String? duration,}){
    _duration = duration;
}

  Additional.fromJson(dynamic json) {
    _duration = json['duration'];
  }
  String? _duration;

  String? get duration => _duration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration'] = _duration;
    return map;
  }

}

class ProjectIdWiseDetailsData {
  ProjectIdWiseDetailsData({
      String? id, 
      String? projectId, 
      String? userId, 
      String? startTime, 
      String? endTime,
      String? remarks, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _projectId = projectId;
    _userId = userId;
    _startTime = startTime;
    _endTime = endTime;
    _remarks = remarks;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  ProjectIdWiseDetailsData.fromJson(dynamic json) {
    _id = json['_id'];
    _projectId = json['projectId'];
    _userId = json['userId'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _remarks = json['remarks'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _projectId;
  String? _userId;
  String? _startTime;
  dynamic _endTime;
  String? _remarks;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get projectId => _projectId;
  String? get userId => _userId;
  String? get startTime => _startTime;
  dynamic get endTime => _endTime;
  String? get remarks => _remarks;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['projectId'] = _projectId;
    map['userId'] = _userId;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['remarks'] = _remarks;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}