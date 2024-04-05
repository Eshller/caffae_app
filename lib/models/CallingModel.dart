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


/** This is an auto generated class representing the CallingModel type in your schema. */
class CallingModel extends amplify_core.Model {
  static const classType = const _CallingModelModelType();
  final String id;
  final String? _callerId;
  final String? _callerName;
  final String? _callerPic;
  final String? _receiverId;
  final String? _receiverName;
  final String? _receiverPic;
  final String? _callId;
  final bool? _hasDialled;
  final bool? _callType;
  final String? _timestamp;
  final String? _pushToken;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CallingModelModelIdentifier get modelIdentifier {
      return CallingModelModelIdentifier(
        id: id
      );
  }
  
  String? get callerId {
    return _callerId;
  }
  
  String? get callerName {
    return _callerName;
  }
  
  String? get callerPic {
    return _callerPic;
  }
  
  String? get receiverId {
    return _receiverId;
  }
  
  String? get receiverName {
    return _receiverName;
  }
  
  String? get receiverPic {
    return _receiverPic;
  }
  
  String? get callId {
    return _callId;
  }
  
  bool? get hasDialled {
    return _hasDialled;
  }
  
  bool? get callType {
    return _callType;
  }
  
  String? get timestamp {
    return _timestamp;
  }
  
  String? get pushToken {
    return _pushToken;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CallingModel._internal({required this.id, callerId, callerName, callerPic, receiverId, receiverName, receiverPic, callId, hasDialled, callType, timestamp, pushToken, createdAt, updatedAt}): _callerId = callerId, _callerName = callerName, _callerPic = callerPic, _receiverId = receiverId, _receiverName = receiverName, _receiverPic = receiverPic, _callId = callId, _hasDialled = hasDialled, _callType = callType, _timestamp = timestamp, _pushToken = pushToken, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CallingModel({String? id, String? callerId, String? callerName, String? callerPic, String? receiverId, String? receiverName, String? receiverPic, String? callId, bool? hasDialled, bool? callType, String? timestamp, String? pushToken}) {
    return CallingModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      callerId: callerId,
      callerName: callerName,
      callerPic: callerPic,
      receiverId: receiverId,
      receiverName: receiverName,
      receiverPic: receiverPic,
      callId: callId,
      hasDialled: hasDialled,
      callType: callType,
      timestamp: timestamp,
      pushToken: pushToken);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CallingModel &&
      id == other.id &&
      _callerId == other._callerId &&
      _callerName == other._callerName &&
      _callerPic == other._callerPic &&
      _receiverId == other._receiverId &&
      _receiverName == other._receiverName &&
      _receiverPic == other._receiverPic &&
      _callId == other._callId &&
      _hasDialled == other._hasDialled &&
      _callType == other._callType &&
      _timestamp == other._timestamp &&
      _pushToken == other._pushToken;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CallingModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("callerId=" + "$_callerId" + ", ");
    buffer.write("callerName=" + "$_callerName" + ", ");
    buffer.write("callerPic=" + "$_callerPic" + ", ");
    buffer.write("receiverId=" + "$_receiverId" + ", ");
    buffer.write("receiverName=" + "$_receiverName" + ", ");
    buffer.write("receiverPic=" + "$_receiverPic" + ", ");
    buffer.write("callId=" + "$_callId" + ", ");
    buffer.write("hasDialled=" + (_hasDialled != null ? _hasDialled!.toString() : "null") + ", ");
    buffer.write("callType=" + (_callType != null ? _callType!.toString() : "null") + ", ");
    buffer.write("timestamp=" + "$_timestamp" + ", ");
    buffer.write("pushToken=" + "$_pushToken" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CallingModel copyWith({String? callerId, String? callerName, String? callerPic, String? receiverId, String? receiverName, String? receiverPic, String? callId, bool? hasDialled, bool? callType, String? timestamp, String? pushToken}) {
    return CallingModel._internal(
      id: id,
      callerId: callerId ?? this.callerId,
      callerName: callerName ?? this.callerName,
      callerPic: callerPic ?? this.callerPic,
      receiverId: receiverId ?? this.receiverId,
      receiverName: receiverName ?? this.receiverName,
      receiverPic: receiverPic ?? this.receiverPic,
      callId: callId ?? this.callId,
      hasDialled: hasDialled ?? this.hasDialled,
      callType: callType ?? this.callType,
      timestamp: timestamp ?? this.timestamp,
      pushToken: pushToken ?? this.pushToken);
  }
  
  CallingModel copyWithModelFieldValues({
    ModelFieldValue<String?>? callerId,
    ModelFieldValue<String?>? callerName,
    ModelFieldValue<String?>? callerPic,
    ModelFieldValue<String?>? receiverId,
    ModelFieldValue<String?>? receiverName,
    ModelFieldValue<String?>? receiverPic,
    ModelFieldValue<String?>? callId,
    ModelFieldValue<bool?>? hasDialled,
    ModelFieldValue<bool?>? callType,
    ModelFieldValue<String?>? timestamp,
    ModelFieldValue<String?>? pushToken
  }) {
    return CallingModel._internal(
      id: id,
      callerId: callerId == null ? this.callerId : callerId.value,
      callerName: callerName == null ? this.callerName : callerName.value,
      callerPic: callerPic == null ? this.callerPic : callerPic.value,
      receiverId: receiverId == null ? this.receiverId : receiverId.value,
      receiverName: receiverName == null ? this.receiverName : receiverName.value,
      receiverPic: receiverPic == null ? this.receiverPic : receiverPic.value,
      callId: callId == null ? this.callId : callId.value,
      hasDialled: hasDialled == null ? this.hasDialled : hasDialled.value,
      callType: callType == null ? this.callType : callType.value,
      timestamp: timestamp == null ? this.timestamp : timestamp.value,
      pushToken: pushToken == null ? this.pushToken : pushToken.value
    );
  }
  
  CallingModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _callerId = json['callerId'],
      _callerName = json['callerName'],
      _callerPic = json['callerPic'],
      _receiverId = json['receiverId'],
      _receiverName = json['receiverName'],
      _receiverPic = json['receiverPic'],
      _callId = json['callId'],
      _hasDialled = json['hasDialled'],
      _callType = json['callType'],
      _timestamp = json['timestamp'],
      _pushToken = json['pushToken'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'callerId': _callerId, 'callerName': _callerName, 'callerPic': _callerPic, 'receiverId': _receiverId, 'receiverName': _receiverName, 'receiverPic': _receiverPic, 'callId': _callId, 'hasDialled': _hasDialled, 'callType': _callType, 'timestamp': _timestamp, 'pushToken': _pushToken, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'callerId': _callerId,
    'callerName': _callerName,
    'callerPic': _callerPic,
    'receiverId': _receiverId,
    'receiverName': _receiverName,
    'receiverPic': _receiverPic,
    'callId': _callId,
    'hasDialled': _hasDialled,
    'callType': _callType,
    'timestamp': _timestamp,
    'pushToken': _pushToken,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CallingModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CallingModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CALLERID = amplify_core.QueryField(fieldName: "callerId");
  static final CALLERNAME = amplify_core.QueryField(fieldName: "callerName");
  static final CALLERPIC = amplify_core.QueryField(fieldName: "callerPic");
  static final RECEIVERID = amplify_core.QueryField(fieldName: "receiverId");
  static final RECEIVERNAME = amplify_core.QueryField(fieldName: "receiverName");
  static final RECEIVERPIC = amplify_core.QueryField(fieldName: "receiverPic");
  static final CALLID = amplify_core.QueryField(fieldName: "callId");
  static final HASDIALLED = amplify_core.QueryField(fieldName: "hasDialled");
  static final CALLTYPE = amplify_core.QueryField(fieldName: "callType");
  static final TIMESTAMP = amplify_core.QueryField(fieldName: "timestamp");
  static final PUSHTOKEN = amplify_core.QueryField(fieldName: "pushToken");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CallingModel";
    modelSchemaDefinition.pluralName = "CallingModels";
    
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
      key: CallingModel.CALLERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.CALLERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.CALLERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.RECEIVERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.RECEIVERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.RECEIVERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.CALLID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.HASDIALLED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.CALLTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.TIMESTAMP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CallingModel.PUSHTOKEN,
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

class _CallingModelModelType extends amplify_core.ModelType<CallingModel> {
  const _CallingModelModelType();
  
  @override
  CallingModel fromJson(Map<String, dynamic> jsonData) {
    return CallingModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CallingModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CallingModel] in your schema.
 */
class CallingModelModelIdentifier implements amplify_core.ModelIdentifier<CallingModel> {
  final String id;

  /** Create an instance of CallingModelModelIdentifier using [id] the primary key. */
  const CallingModelModelIdentifier({
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
  String toString() => 'CallingModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CallingModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}