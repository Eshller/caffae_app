/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the MeetingModel type in your schema. */
class MeetingModel extends amplify_core.Model {
  static const classType = const _MeetingModelModelType();
  final String id;
  final String? _senderId;
  final String? _receiverId;
  final String? _senderName;
  final String? _receiverPic;
  final String? _receiverName;
  final String? _date;
  final String? _time;
  final bool? _isAccept;
  final bool? _isAudio;
  final bool? _isVideo;
  final bool? _isDone;
  final bool? _isDonePayment;
  final bool? _isDecline;
  final String? _senderPic;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MeetingModelModelIdentifier get modelIdentifier {
      return MeetingModelModelIdentifier(
        id: id
      );
  }
  
  String? get senderId {
    return _senderId;
  }
  
  String? get receiverId {
    return _receiverId;
  }
  
  String? get senderName {
    return _senderName;
  }
  
  String? get receiverPic {
    return _receiverPic;
  }
  
  String? get receiverName {
    return _receiverName;
  }
  
  String? get date {
    return _date;
  }
  
  String? get time {
    return _time;
  }
  
  bool? get isAccept {
    return _isAccept;
  }
  
  bool? get isAudio {
    return _isAudio;
  }
  
  bool? get isVideo {
    return _isVideo;
  }
  
  bool? get isDone {
    return _isDone;
  }
  
  bool? get isDonePayment {
    return _isDonePayment;
  }
  
  bool? get isDecline {
    return _isDecline;
  }
  
  String? get senderPic {
    return _senderPic;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MeetingModel._internal({required this.id, senderId, receiverId, senderName, receiverPic, receiverName, date, time, isAccept, isAudio, isVideo, isDone, isDonePayment, isDecline, senderPic, createdAt, updatedAt}): _senderId = senderId, _receiverId = receiverId, _senderName = senderName, _receiverPic = receiverPic, _receiverName = receiverName, _date = date, _time = time, _isAccept = isAccept, _isAudio = isAudio, _isVideo = isVideo, _isDone = isDone, _isDonePayment = isDonePayment, _isDecline = isDecline, _senderPic = senderPic, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MeetingModel({String? id, String? senderId, String? receiverId, String? senderName, String? receiverPic, String? receiverName, String? date, String? time, bool? isAccept, bool? isAudio, bool? isVideo, bool? isDone, bool? isDonePayment, bool? isDecline, String? senderPic}) {
    return MeetingModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      senderId: senderId,
      receiverId: receiverId,
      senderName: senderName,
      receiverPic: receiverPic,
      receiverName: receiverName,
      date: date,
      time: time,
      isAccept: isAccept,
      isAudio: isAudio,
      isVideo: isVideo,
      isDone: isDone,
      isDonePayment: isDonePayment,
      isDecline: isDecline,
      senderPic: senderPic);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeetingModel &&
      id == other.id &&
      _senderId == other._senderId &&
      _receiverId == other._receiverId &&
      _senderName == other._senderName &&
      _receiverPic == other._receiverPic &&
      _receiverName == other._receiverName &&
      _date == other._date &&
      _time == other._time &&
      _isAccept == other._isAccept &&
      _isAudio == other._isAudio &&
      _isVideo == other._isVideo &&
      _isDone == other._isDone &&
      _isDonePayment == other._isDonePayment &&
      _isDecline == other._isDecline &&
      _senderPic == other._senderPic;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MeetingModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("senderId=" + "$_senderId" + ", ");
    buffer.write("receiverId=" + "$_receiverId" + ", ");
    buffer.write("senderName=" + "$_senderName" + ", ");
    buffer.write("receiverPic=" + "$_receiverPic" + ", ");
    buffer.write("receiverName=" + "$_receiverName" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time" + ", ");
    buffer.write("isAccept=" + (_isAccept != null ? _isAccept!.toString() : "null") + ", ");
    buffer.write("isAudio=" + (_isAudio != null ? _isAudio!.toString() : "null") + ", ");
    buffer.write("isVideo=" + (_isVideo != null ? _isVideo!.toString() : "null") + ", ");
    buffer.write("isDone=" + (_isDone != null ? _isDone!.toString() : "null") + ", ");
    buffer.write("isDonePayment=" + (_isDonePayment != null ? _isDonePayment!.toString() : "null") + ", ");
    buffer.write("isDecline=" + (_isDecline != null ? _isDecline!.toString() : "null") + ", ");
    buffer.write("senderPic=" + "$_senderPic" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MeetingModel copyWith({String? senderId, String? receiverId, String? senderName, String? receiverPic, String? receiverName, String? date, String? time, bool? isAccept, bool? isAudio, bool? isVideo, bool? isDone, bool? isDonePayment, bool? isDecline, String? senderPic}) {
    return MeetingModel._internal(
      id: id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      senderName: senderName ?? this.senderName,
      receiverPic: receiverPic ?? this.receiverPic,
      receiverName: receiverName ?? this.receiverName,
      date: date ?? this.date,
      time: time ?? this.time,
      isAccept: isAccept ?? this.isAccept,
      isAudio: isAudio ?? this.isAudio,
      isVideo: isVideo ?? this.isVideo,
      isDone: isDone ?? this.isDone,
      isDonePayment: isDonePayment ?? this.isDonePayment,
      isDecline: isDecline ?? this.isDecline,
      senderPic: senderPic ?? this.senderPic);
  }
  
  MeetingModel copyWithModelFieldValues({
    ModelFieldValue<String?>? senderId,
    ModelFieldValue<String?>? receiverId,
    ModelFieldValue<String?>? senderName,
    ModelFieldValue<String?>? receiverPic,
    ModelFieldValue<String?>? receiverName,
    ModelFieldValue<String?>? date,
    ModelFieldValue<String?>? time,
    ModelFieldValue<bool?>? isAccept,
    ModelFieldValue<bool?>? isAudio,
    ModelFieldValue<bool?>? isVideo,
    ModelFieldValue<bool?>? isDone,
    ModelFieldValue<bool?>? isDonePayment,
    ModelFieldValue<bool?>? isDecline,
    ModelFieldValue<String?>? senderPic
  }) {
    return MeetingModel._internal(
      id: id,
      senderId: senderId == null ? this.senderId : senderId.value,
      receiverId: receiverId == null ? this.receiverId : receiverId.value,
      senderName: senderName == null ? this.senderName : senderName.value,
      receiverPic: receiverPic == null ? this.receiverPic : receiverPic.value,
      receiverName: receiverName == null ? this.receiverName : receiverName.value,
      date: date == null ? this.date : date.value,
      time: time == null ? this.time : time.value,
      isAccept: isAccept == null ? this.isAccept : isAccept.value,
      isAudio: isAudio == null ? this.isAudio : isAudio.value,
      isVideo: isVideo == null ? this.isVideo : isVideo.value,
      isDone: isDone == null ? this.isDone : isDone.value,
      isDonePayment: isDonePayment == null ? this.isDonePayment : isDonePayment.value,
      isDecline: isDecline == null ? this.isDecline : isDecline.value,
      senderPic: senderPic == null ? this.senderPic : senderPic.value
    );
  }
  
  MeetingModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _senderId = json['senderId'],
      _receiverId = json['receiverId'],
      _senderName = json['senderName'],
      _receiverPic = json['receiverPic'],
      _receiverName = json['receiverName'],
      _date = json['date'],
      _time = json['time'],
      _isAccept = json['isAccept'],
      _isAudio = json['isAudio'],
      _isVideo = json['isVideo'],
      _isDone = json['isDone'],
      _isDonePayment = json['isDonePayment'],
      _isDecline = json['isDecline'],
      _senderPic = json['senderPic'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'senderId': _senderId, 'receiverId': _receiverId, 'senderName': _senderName, 'receiverPic': _receiverPic, 'receiverName': _receiverName, 'date': _date, 'time': _time, 'isAccept': _isAccept, 'isAudio': _isAudio, 'isVideo': _isVideo, 'isDone': _isDone, 'isDonePayment': _isDonePayment, 'isDecline': _isDecline, 'senderPic': _senderPic, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'senderId': _senderId,
    'receiverId': _receiverId,
    'senderName': _senderName,
    'receiverPic': _receiverPic,
    'receiverName': _receiverName,
    'date': _date,
    'time': _time,
    'isAccept': _isAccept,
    'isAudio': _isAudio,
    'isVideo': _isVideo,
    'isDone': _isDone,
    'isDonePayment': _isDonePayment,
    'isDecline': _isDecline,
    'senderPic': _senderPic,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MeetingModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MeetingModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SENDERID = amplify_core.QueryField(fieldName: "senderId");
  static final RECEIVERID = amplify_core.QueryField(fieldName: "receiverId");
  static final SENDERNAME = amplify_core.QueryField(fieldName: "senderName");
  static final RECEIVERPIC = amplify_core.QueryField(fieldName: "receiverPic");
  static final RECEIVERNAME = amplify_core.QueryField(fieldName: "receiverName");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TIME = amplify_core.QueryField(fieldName: "time");
  static final ISACCEPT = amplify_core.QueryField(fieldName: "isAccept");
  static final ISAUDIO = amplify_core.QueryField(fieldName: "isAudio");
  static final ISVIDEO = amplify_core.QueryField(fieldName: "isVideo");
  static final ISDONE = amplify_core.QueryField(fieldName: "isDone");
  static final ISDONEPAYMENT = amplify_core.QueryField(fieldName: "isDonePayment");
  static final ISDECLINE = amplify_core.QueryField(fieldName: "isDecline");
  static final SENDERPIC = amplify_core.QueryField(fieldName: "senderPic");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MeetingModel";
    modelSchemaDefinition.pluralName = "MeetingModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.SENDERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.RECEIVERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.SENDERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.RECEIVERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.RECEIVERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.TIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISACCEPT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISAUDIO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISVIDEO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISDONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISDONEPAYMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.ISDECLINE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: MeetingModel.SENDERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MeetingModelModelType extends amplify_core.ModelType<MeetingModel> {
  const _MeetingModelModelType();
  
  @override
  MeetingModel fromJson(Map<String, dynamic> jsonData) {
    return MeetingModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'MeetingModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MeetingModel] in your schema.
 */
class MeetingModelModelIdentifier implements amplify_core.ModelIdentifier<MeetingModel> {
  final String id;

  /** Create an instance of MeetingModelModelIdentifier using [id] the primary key. */
  const MeetingModelModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'MeetingModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MeetingModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}