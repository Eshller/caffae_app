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


/** This is an auto generated class representing the PaymentHistory type in your schema. */
class PaymentHistory extends amplify_core.Model {
  static const classType = const _PaymentHistoryModelType();
  final String id;
  final String? _senderId;
  final String? _senderName;
  final String? _senderPic;
  final String? _receiverId;
  final String? _receiverName;
  final String? _receiverPic;
  final String? _date;
  final String? _time;
  final String? _amount;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PaymentHistoryModelIdentifier get modelIdentifier {
      return PaymentHistoryModelIdentifier(
        id: id
      );
  }
  
  String? get senderId {
    return _senderId;
  }
  
  String? get senderName {
    return _senderName;
  }
  
  String? get senderPic {
    return _senderPic;
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
  
  String? get date {
    return _date;
  }
  
  String? get time {
    return _time;
  }
  
  String? get amount {
    return _amount;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PaymentHistory._internal({required this.id, senderId, senderName, senderPic, receiverId, receiverName, receiverPic, date, time, amount, createdAt, updatedAt}): _senderId = senderId, _senderName = senderName, _senderPic = senderPic, _receiverId = receiverId, _receiverName = receiverName, _receiverPic = receiverPic, _date = date, _time = time, _amount = amount, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PaymentHistory({String? id, String? senderId, String? senderName, String? senderPic, String? receiverId, String? receiverName, String? receiverPic, String? date, String? time, String? amount}) {
    return PaymentHistory._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      senderId: senderId,
      senderName: senderName,
      senderPic: senderPic,
      receiverId: receiverId,
      receiverName: receiverName,
      receiverPic: receiverPic,
      date: date,
      time: time,
      amount: amount);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentHistory &&
      id == other.id &&
      _senderId == other._senderId &&
      _senderName == other._senderName &&
      _senderPic == other._senderPic &&
      _receiverId == other._receiverId &&
      _receiverName == other._receiverName &&
      _receiverPic == other._receiverPic &&
      _date == other._date &&
      _time == other._time &&
      _amount == other._amount;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentHistory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("senderId=" + "$_senderId" + ", ");
    buffer.write("senderName=" + "$_senderName" + ", ");
    buffer.write("senderPic=" + "$_senderPic" + ", ");
    buffer.write("receiverId=" + "$_receiverId" + ", ");
    buffer.write("receiverName=" + "$_receiverName" + ", ");
    buffer.write("receiverPic=" + "$_receiverPic" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time" + ", ");
    buffer.write("amount=" + "$_amount" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentHistory copyWith({String? senderId, String? senderName, String? senderPic, String? receiverId, String? receiverName, String? receiverPic, String? date, String? time, String? amount}) {
    return PaymentHistory._internal(
      id: id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderPic: senderPic ?? this.senderPic,
      receiverId: receiverId ?? this.receiverId,
      receiverName: receiverName ?? this.receiverName,
      receiverPic: receiverPic ?? this.receiverPic,
      date: date ?? this.date,
      time: time ?? this.time,
      amount: amount ?? this.amount);
  }
  
  PaymentHistory copyWithModelFieldValues({
    ModelFieldValue<String?>? senderId,
    ModelFieldValue<String?>? senderName,
    ModelFieldValue<String?>? senderPic,
    ModelFieldValue<String?>? receiverId,
    ModelFieldValue<String?>? receiverName,
    ModelFieldValue<String?>? receiverPic,
    ModelFieldValue<String?>? date,
    ModelFieldValue<String?>? time,
    ModelFieldValue<String?>? amount
  }) {
    return PaymentHistory._internal(
      id: id,
      senderId: senderId == null ? this.senderId : senderId.value,
      senderName: senderName == null ? this.senderName : senderName.value,
      senderPic: senderPic == null ? this.senderPic : senderPic.value,
      receiverId: receiverId == null ? this.receiverId : receiverId.value,
      receiverName: receiverName == null ? this.receiverName : receiverName.value,
      receiverPic: receiverPic == null ? this.receiverPic : receiverPic.value,
      date: date == null ? this.date : date.value,
      time: time == null ? this.time : time.value,
      amount: amount == null ? this.amount : amount.value
    );
  }
  
  PaymentHistory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _senderId = json['senderId'],
      _senderName = json['senderName'],
      _senderPic = json['senderPic'],
      _receiverId = json['receiverId'],
      _receiverName = json['receiverName'],
      _receiverPic = json['receiverPic'],
      _date = json['date'],
      _time = json['time'],
      _amount = json['amount'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'senderId': _senderId, 'senderName': _senderName, 'senderPic': _senderPic, 'receiverId': _receiverId, 'receiverName': _receiverName, 'receiverPic': _receiverPic, 'date': _date, 'time': _time, 'amount': _amount, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'senderId': _senderId,
    'senderName': _senderName,
    'senderPic': _senderPic,
    'receiverId': _receiverId,
    'receiverName': _receiverName,
    'receiverPic': _receiverPic,
    'date': _date,
    'time': _time,
    'amount': _amount,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PaymentHistoryModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PaymentHistoryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SENDERID = amplify_core.QueryField(fieldName: "senderId");
  static final SENDERNAME = amplify_core.QueryField(fieldName: "senderName");
  static final SENDERPIC = amplify_core.QueryField(fieldName: "senderPic");
  static final RECEIVERID = amplify_core.QueryField(fieldName: "receiverId");
  static final RECEIVERNAME = amplify_core.QueryField(fieldName: "receiverName");
  static final RECEIVERPIC = amplify_core.QueryField(fieldName: "receiverPic");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TIME = amplify_core.QueryField(fieldName: "time");
  static final AMOUNT = amplify_core.QueryField(fieldName: "amount");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentHistory";
    modelSchemaDefinition.pluralName = "PaymentHistories";
    
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
      key: PaymentHistory.SENDERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.SENDERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.SENDERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.RECEIVERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.RECEIVERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.RECEIVERPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.TIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentHistory.AMOUNT,
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

class _PaymentHistoryModelType extends amplify_core.ModelType<PaymentHistory> {
  const _PaymentHistoryModelType();
  
  @override
  PaymentHistory fromJson(Map<String, dynamic> jsonData) {
    return PaymentHistory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PaymentHistory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PaymentHistory] in your schema.
 */
class PaymentHistoryModelIdentifier implements amplify_core.ModelIdentifier<PaymentHistory> {
  final String id;

  /** Create an instance of PaymentHistoryModelIdentifier using [id] the primary key. */
  const PaymentHistoryModelIdentifier({
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
  String toString() => 'PaymentHistoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PaymentHistoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}