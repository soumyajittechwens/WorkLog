class CheckInOutData {
  String? checkInTime;
  String? checkOutTime;

  CheckInOutData({
    this.checkInTime,
    this.checkOutTime,
  });



  factory CheckInOutData.fromJson(Map<String, dynamic> json) {
    return CheckInOutData(
      checkInTime: json['checkInTime'],
      checkOutTime: json['checkOutTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckInOutData &&
        other.checkInTime == checkInTime &&
        other.checkOutTime == checkOutTime;
  }

  @override
  int get hashCode => checkInTime.hashCode ^ checkOutTime.hashCode;
}
