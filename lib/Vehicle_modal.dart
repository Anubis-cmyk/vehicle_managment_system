class Vehicle{
  String id;
  final String vehicleNumber;
  final String departmentNumber;
  final String registrationNumber;
  final String division;
  final String modal;
  final String type;
  final String state;
  final String oparatorName;
  final String oparatingWeight;
  final String consumption;
  final String remark;


  Vehicle({
    required this.id,
    required this.vehicleNumber,
    required this.departmentNumber,
    required this.registrationNumber,
    required this.division,
    required this.modal,
    required this.type,
    required this.state,
    required this.oparatorName,
    required this.oparatingWeight,
    required this.consumption,
    required this.remark});


  Map<String,dynamic> toJson() =>{
    'id':id,
    'vehicleNumber' : vehicleNumber,
    'departmentNumber' : departmentNumber,
    'registrationNumber' : registrationNumber,
    'division' : division,
    'modal' : modal,
    'type' : type,
    'state' : state,
    'oparatorName' : oparatorName,
    'oparationWeight' : oparatingWeight,
    'consumption' : consumption,
    'remark' : remark,
  };

  static Vehicle fromJson(Map<String,dynamic>json) => Vehicle(
      id:json['id'],
      vehicleNumber: json['vehicleNumber'],
      departmentNumber: json['departmentNumber'],
      registrationNumber: json['registrationNumber'],
      division: json['division'],
      modal: json['modal'],
      type: json['type'],
      state: json['state'],
      oparatorName: json['oparatorName'],
      oparatingWeight: json['oparationWeight'],
      consumption: json['consumption'],
      remark: json['remark']
  );

  static String getDivision(Map<String,dynamic>json) => json['division'];
}