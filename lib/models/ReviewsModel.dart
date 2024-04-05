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


/** This is an auto generated class representing the ReviewsModel type in your schema. */
class ReviewsModel extends amplify_core.Model {
  static const classType = const _ReviewsModelModelType();
  final String id;
  final String? _senderId;
  final String? _recieverId;
  final int? _rating;
  final String? _message;
  final String? _senderName;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ReviewsModelModelIdentifier get modelIdentifier {
      return ReviewsModelModelIdentifier(
        id: id
      );
  }
  
  String? get senderId {
    return _senderId;
  }
  
  String? get recieverId {
    return _recieverId;
  }
  
  int? get rating {
    return _rating;
  }
  
  String? get message {
    return _message;
  }
  
  String? get senderName {
    return _senderName;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ReviewsModel._internal({required this.id, senderId, recieverId, rating, message, senderName, createdAt, updatedAt}): _senderId = senderId, _recieverId = recieverId, _rating = rating, _message = message, _senderName = senderName, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ReviewsModel({String? id, String? senderId, String? recieverId, int? rating, String? message, String? senderName}) {
    return ReviewsModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      senderId: senderId,
      recieverId: recieverId,
      rating: rating,
      message: message,
      senderName: senderName);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsModel &&
      id == other.id &&
      _senderId == other._senderId &&
      _recieverId == other._recieverId &&
      _rating == other._rating &&
      _message == other._message &&
      _senderName == other._senderName;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ReviewsModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("senderId=" + "$_senderId" + ", ");
    buffer.write("recieverId=" + "$_recieverId" + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("senderName=" + "$_senderName" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ReviewsModel copyWith({String? senderId, String? recieverId, int? rating, String? message, String? senderName}) {
    return ReviewsModel._internal(
      id: id,
      senderId: senderId ?? this.senderId,
      recieverId: recieverId ?? this.recieverId,
      rating: rating ?? this.rating,
      message: message ?? this.message,
      senderName: senderName ?? this.senderName);
  }
  
  ReviewsModel copyWithModelFieldValues({
    ModelFieldValue<String?>? senderId,
    ModelFieldValue<String?>? recieverId,
    ModelFieldValue<int?>? rating,
    ModelFieldValue<String?>? message,
    ModelFieldValue<String?>? senderName
  }) {
    return ReviewsModel._internal(
      id: id,
      senderId: senderId == null ? this.senderId : senderId.value,
      recieverId: recieverId == null ? this.recieverId : recieverId.value,
      rating: rating == null ? this.rating : rating.value,
      message: message == null ? this.message : message.value,
      senderName: senderName == null ? this.senderName : senderName.value
    );
  }
  
  ReviewsModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _senderId = json['senderId'],
      _recieverId = json['recieverId'],
      _rating = (json['rating'] as num?)?.toInt(),
      _message = json['message'],
      _senderName = json['senderName'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'senderId': _senderId, 'recieverId': _recieverId, 'rating': _rating, 'message': _message, 'senderName': _senderName, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'senderId': _senderId,
    'recieverId': _recieverId,
    'rating': _rating,
    'message': _message,
    'senderName': _senderName,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ReviewsModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ReviewsModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SENDERID = amplify_core.QueryField(fieldName: "senderId");
  static final RECIEVERID = amplify_core.QueryField(fieldName: "recieverId");
  static final RATING = amplify_core.QueryField(fieldName: "rating");
  static final MESSAGE = amplify_core.QueryField(fieldName: "message");
  static final SENDERNAME = amplify_core.QueryField(fieldName: "senderName");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReviewsModel";
    modelSchemaDefinition.pluralName = "ReviewsModels";
    
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
      key: ReviewsModel.SENDERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReviewsModel.RECIEVERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReviewsModel.RATING,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReviewsModel.MESSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReviewsModel.SENDERNAME,
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

class _ReviewsModelModelType extends amplify_core.ModelType<ReviewsModel> {
  const _ReviewsModelModelType();
  
  @override
  ReviewsModel fromJson(Map<String, dynamic> jsonData) {
    return ReviewsModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ReviewsModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ReviewsModel] in your schema.
 */
class ReviewsModelModelIdentifier implements amplify_core.ModelIdentifier<ReviewsModel> {
  final String id;

  /** Create an instance of ReviewsModelModelIdentifier using [id] the primary key. */
  const ReviewsModelModelIdentifier({
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
  String toString() => 'ReviewsModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ReviewsModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}