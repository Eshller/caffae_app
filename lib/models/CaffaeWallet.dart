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


/** This is an auto generated class representing the CaffaeWallet type in your schema. */
class CaffaeWallet extends amplify_core.Model {
  static const classType = const _CaffaeWalletModelType();
  final String id;
  final String? _userId;
  final String? _username;
  final String? _profilePic;
  final String? _totalPoints;
  final String? _phoneNumber;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CaffaeWalletModelIdentifier get modelIdentifier {
      return CaffaeWalletModelIdentifier(
        id: id
      );
  }
  
  String? get userId {
    return _userId;
  }
  
  String? get username {
    return _username;
  }
  
  String? get profilePic {
    return _profilePic;
  }
  
  String? get totalPoints {
    return _totalPoints;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CaffaeWallet._internal({required this.id, userId, username, profilePic, totalPoints, phoneNumber, createdAt, updatedAt}): _userId = userId, _username = username, _profilePic = profilePic, _totalPoints = totalPoints, _phoneNumber = phoneNumber, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CaffaeWallet({String? id, String? userId, String? username, String? profilePic, String? totalPoints, String? phoneNumber}) {
    return CaffaeWallet._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userId: userId,
      username: username,
      profilePic: profilePic,
      totalPoints: totalPoints,
      phoneNumber: phoneNumber);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CaffaeWallet &&
      id == other.id &&
      _userId == other._userId &&
      _username == other._username &&
      _profilePic == other._profilePic &&
      _totalPoints == other._totalPoints &&
      _phoneNumber == other._phoneNumber;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CaffaeWallet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("profilePic=" + "$_profilePic" + ", ");
    buffer.write("totalPoints=" + "$_totalPoints" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CaffaeWallet copyWith({String? userId, String? username, String? profilePic, String? totalPoints, String? phoneNumber}) {
    return CaffaeWallet._internal(
      id: id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      totalPoints: totalPoints ?? this.totalPoints,
      phoneNumber: phoneNumber ?? this.phoneNumber);
  }
  
  CaffaeWallet copyWithModelFieldValues({
    ModelFieldValue<String?>? userId,
    ModelFieldValue<String?>? username,
    ModelFieldValue<String?>? profilePic,
    ModelFieldValue<String?>? totalPoints,
    ModelFieldValue<String?>? phoneNumber
  }) {
    return CaffaeWallet._internal(
      id: id,
      userId: userId == null ? this.userId : userId.value,
      username: username == null ? this.username : username.value,
      profilePic: profilePic == null ? this.profilePic : profilePic.value,
      totalPoints: totalPoints == null ? this.totalPoints : totalPoints.value,
      phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber.value
    );
  }
  
  CaffaeWallet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _username = json['username'],
      _profilePic = json['profilePic'],
      _totalPoints = json['totalPoints'],
      _phoneNumber = json['phoneNumber'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'username': _username, 'profilePic': _profilePic, 'totalPoints': _totalPoints, 'phoneNumber': _phoneNumber, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userId': _userId,
    'username': _username,
    'profilePic': _profilePic,
    'totalPoints': _totalPoints,
    'phoneNumber': _phoneNumber,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CaffaeWalletModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CaffaeWalletModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final PROFILEPIC = amplify_core.QueryField(fieldName: "profilePic");
  static final TOTALPOINTS = amplify_core.QueryField(fieldName: "totalPoints");
  static final PHONENUMBER = amplify_core.QueryField(fieldName: "phoneNumber");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CaffaeWallet";
    modelSchemaDefinition.pluralName = "CaffaeWallets";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CaffaeWallet.USERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CaffaeWallet.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CaffaeWallet.PROFILEPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CaffaeWallet.TOTALPOINTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CaffaeWallet.PHONENUMBER,
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

class _CaffaeWalletModelType extends amplify_core.ModelType<CaffaeWallet> {
  const _CaffaeWalletModelType();
  
  @override
  CaffaeWallet fromJson(Map<String, dynamic> jsonData) {
    return CaffaeWallet.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CaffaeWallet';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CaffaeWallet] in your schema.
 */
class CaffaeWalletModelIdentifier implements amplify_core.ModelIdentifier<CaffaeWallet> {
  final String id;

  /** Create an instance of CaffaeWalletModelIdentifier using [id] the primary key. */
  const CaffaeWalletModelIdentifier({
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
  String toString() => 'CaffaeWalletModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CaffaeWalletModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}