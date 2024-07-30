class ProjectListData {
  ProjectListData({
      String? message, 
      bool? status, 
      num? statusCode, 
      List<ProjectListDetailsData>? response,}){
    _message = message;
    _status = status;
    _statusCode = statusCode;
    _response = response;
}

  ProjectListData.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _statusCode = json['statusCode'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(ProjectListDetailsData.fromJson(v));
      });
    }
  }
  String? _message;
  bool? _status;
  num? _statusCode;
  List<ProjectListDetailsData>? _response;

  String? get message => _message;
  bool? get status => _status;
  num? get statusCode => _statusCode;
  List<ProjectListDetailsData>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['statusCode'] = _statusCode;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProjectListDetailsData {
  ProjectListDetailsData({
      String? id, 
      String? name, 
      String? slug, 
      String? description, 
      String? client, 
      bool? isInhouse, 
      Reporter? reporter, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _name = name;
    _slug = slug;
    _description = description;
    _client = client;
    _isInhouse = isInhouse;
    _reporter = reporter;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  ProjectListDetailsData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _client = json['client'];
    _isInhouse = json['isInhouse'];
    _reporter = json['reporter'] != null ? Reporter.fromJson(json['reporter']) : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _description;
  String? _client;
  bool? _isInhouse;
  Reporter? _reporter;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get description => _description;
  String? get client => _client;
  bool? get isInhouse => _isInhouse;
  Reporter? get reporter => _reporter;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['description'] = _description;
    map['client'] = _client;
    map['isInhouse'] = _isInhouse;
    if (_reporter != null) {
      map['reporter'] = _reporter?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

class Reporter {
  Reporter({
      String? id, 
      String? fullName, 
      String? email,}){
    _id = id;
    _fullName = fullName;
    _email = email;
}

  Reporter.fromJson(dynamic json) {
    _id = json['_id'];
    _fullName = json['fullName'];
    _email = json['email'];
  }
  String? _id;
  String? _fullName;
  String? _email;

  String? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['fullName'] = _fullName;
    map['email'] = _email;
    return map;
  }

}