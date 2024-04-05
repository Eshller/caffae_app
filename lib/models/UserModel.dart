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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the UserModel type in your schema. */
class UserModel extends amplify_core.Model {
  static const classType = const _UserModelModelType();
  final String id;
  final String? _username;
  final String? _phoneNumber;
  final String? _createdAt;
  final bool? _isVerified;
  final bool? _isGuru;
  final List<String>? _listExplore;
  final String? _photoUrl;
  final String? _role;
  final String? _documentId;
  final String? _pushToken;
  final String? _name;
  final String? _email;
  final String? _callNumber;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelModelIdentifier get modelIdentifier {
      return UserModelModelIdentifier(
        id: id
      );
  }
  
  String? get username {
    return _username;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  String? get createdAt {
    return _createdAt;
  }
  
  bool? get isVerified {
    return _isVerified;
  }
  
  bool? get isGuru {
    return _isGuru;
  }
  
  List<String>? get listExplore {
    return _listExplore;
  }
  
  String? get photoUrl {
    return _photoUrl;
  }
  
  String? get role {
    return _role;
  }
  
  String? get documentId {
    return _documentId;
  }
  
  String? get pushToken {
    return _pushToken;
  }
  
  String? get name {
    return _name;
  }
  
  String? get email {
    return _email;
  }
  
  String? get callNumber {
    return _callNumber;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserModel._internal({required this.id, username, phoneNumber, createdAt, isVerified, isGuru, listExplore, photoUrl, role, documentId, pushToken, name, email, callNumber, updatedAt}): _username = username, _phoneNumber = phoneNumber, _createdAt = createdAt, _isVerified = isVerified, _isGuru = isGuru, _listExplore = listExplore, _photoUrl = photoUrl, _role = role, _documentId = documentId, _pushToken = pushToken, _name = name, _email = email, _callNumber = callNumber, _updatedAt = updatedAt;
  
  factory UserModel({String? id, String? username, String? phoneNumber, String? createdAt, bool? isVerified, bool? isGuru, List<String>? listExplore, String? photoUrl, String? role, String? documentId, String? pushToken, String? name, String? email, String? callNumber}) {
    return UserModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
      isVerified: isVerified,
      isGuru: isGuru,
      listExplore: listExplore != null ? List<String>.unmodifiable(listExplore) : listExplore,
      photoUrl: photoUrl,
      role: role,
      documentId: documentId,
      pushToken: pushToken,
      name: name,
      email: email,
      callNumber: callNumber);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
      id == other.id &&
      _username == other._username &&
      _phoneNumber == other._phoneNumber &&
      _createdAt == other._createdAt &&
      _isVerified == other._isVerified &&
      _isGuru == other._isGuru &&
      DeepCollectionEquality().equals(_listExplore, other._listExplore) &&
      _photoUrl == other._photoUrl &&
      _role == other._role &&
      _documentId == other._documentId &&
      _pushToken == other._pushToken &&
      _name == other._name &&
      _email == other._email &&
      _callNumber == other._callNumber;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("isVerified=" + (_isVerified != null ? _isVerified!.toString() : "null") + ", ");
    buffer.write("isGuru=" + (_isGuru != null ? _isGuru!.toString() : "null") + ", ");
    buffer.write("listExplore=" + (_listExplore != null ? _listExplore!.toString() : "null") + ", ");
    buffer.write("photoUrl=" + "$_photoUrl" + ", ");
    buffer.write("role=" + "$_role" + ", ");
    buffer.write("documentId=" + "$_documentId" + ", ");
    buffer.write("pushToken=" + "$_pushToken" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("callNumber=" + "$_callNumber" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserModel copyWith({String? username, String? phoneNumber, String? createdAt, bool? isVerified, bool? isGuru, List<String>? listExplore, String? photoUrl, String? role, String? documentId, String? pushToken, String? name, String? email, String? callNumber}) {
    return UserModel._internal(
      id: id,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
      isGuru: isGuru ?? this.isGuru,
      listExplore: listExplore ?? this.listExplore,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      documentId: documentId ?? this.documentId,
      pushToken: pushToken ?? this.pushToken,
      name: name ?? this.name,
      email: email ?? this.email,
      callNumber: callNumber ?? this.callNumber);
  }
  
  UserModel copyWithModelFieldValues({
    ModelFieldValue<String?>? username,
    ModelFieldValue<String?>? phoneNumber,
    ModelFieldValue<String?>? createdAt,
    ModelFieldValue<bool?>? isVerified,
    ModelFieldValue<bool?>? isGuru,
    ModelFieldValue<List<String>?>? listExplore,
    ModelFieldValue<String?>? photoUrl,
    ModelFieldValue<String?>? role,
    ModelFieldValue<String?>? documentId,
    ModelFieldValue<String?>? pushToken,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? callNumber
  }) {
    return UserModel._internal(
      id: id,
      username: username == null ? this.username : username.value,
      phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      isVerified: isVerified == null ? this.isVerified : isVerified.value,
      isGuru: isGuru == null ? this.isGuru : isGuru.value,
      listExplore: listExplore == null ? this.listExplore : listExplore.value,
      photoUrl: photoUrl == null ? this.photoUrl : photoUrl.value,
      role: role == null ? this.role : role.value,
      documentId: documentId == null ? this.documentId : documentId.value,
      pushToken: pushToken == null ? this.pushToken : pushToken.value,
      name: name == null ? this.name : name.value,
      email: email == null ? this.email : email.value,
      callNumber: callNumber == null ? this.callNumber : callNumber.value
    );
  }
  
  UserModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _phoneNumber = json['phoneNumber'],
      _createdAt = json['createdAt'],
      _isVerified = json['isVerified'],
      _isGuru = json['isGuru'],
      _listExplore = json['listExplore']?.cast<String>(),
      _photoUrl = json['photoUrl'],
      _role = json['role'],
      _documentId = json['documentId'],
      _pushToken = json['pushToken'],
      _name = json['name'],
      _email = json['email'],
      _callNumber = json['callNumber'],
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'phoneNumber': _phoneNumber, 'createdAt': _createdAt, 'isVerified': _isVerified, 'isGuru': _isGuru, 'listExplore': _listExplore, 'photoUrl': _photoUrl, 'role': _role, 'documentId': _documentId, 'pushToken': _pushToken, 'name': _name, 'email': _email, 'callNumber': _callNumber, 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'phoneNumber': _phoneNumber,
    'createdAt': _createdAt,
    'isVerified': _isVerified,
    'isGuru': _isGuru,
    'listExplore': _listExplore,
    'photoUrl': _photoUrl,
    'role': _role,
    'documentId': _documentId,
    'pushToken': _pushToken,
    'name': _name,
    'email': _email,
    'callNumber': _callNumber,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final PHONENUMBER = amplify_core.QueryField(fieldName: "phoneNumber");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final ISVERIFIED = amplify_core.QueryField(fieldName: "isVerified");
  static final ISGURU = amplify_core.QueryField(fieldName: "isGuru");
  static final LISTEXPLORE = amplify_core.QueryField(fieldName: "listExplore");
  static final PHOTOURL = amplify_core.QueryField(fieldName: "photoUrl");
  static final ROLE = amplify_core.QueryField(fieldName: "role");
  static final DOCUMENTID = amplify_core.QueryField(fieldName: "documentId");
  static final PUSHTOKEN = amplify_core.QueryField(fieldName: "pushToken");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final CALLNUMBER = amplify_core.QueryField(fieldName: "callNumber");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserModel";
    modelSchemaDefinition.pluralName = "UserModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        provider: amplify_core.AuthRuleProvider.IAM,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.PHONENUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.ISVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.ISGURU,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.LISTEXPLORE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.PHOTOURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.ROLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.DOCUMENTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.PUSHTOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.CALLNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelModelType extends amplify_core.ModelType<UserModel> {
  const _UserModelModelType();
  
  @override
  UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserModel] in your schema.
 */
class UserModelModelIdentifier implements amplify_core.ModelIdentifier<UserModel> {
  final String id;

  /** Create an instance of UserModelModelIdentifier using [id] the primary key. */
  const UserModelModelIdentifier({
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
  String toString() => 'UserModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}