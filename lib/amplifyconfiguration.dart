const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "23e6161dab6c46848b55fde344fefe5a",
                    "region": "ap-south-1"
                },
                "pinpointTargeting": {
                    "region": "ap-south-1"
                }
            }
        }
    },
    "notifications": {
        "plugins": {
            "awsPinpointPushNotificationsPlugin": {
                "appId": "23e6161dab6c46848b55fde344fefe5a",
                "region": "ap-south-1"
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "caffae": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://rt56uofwmrgbbnjmzkxgn3bfga.appsync-api.ap-south-1.amazonaws.com/graphql",
                    "region": "ap-south-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-fsjaxsmc5bb6rb443uvwtwghou"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "23e6161dab6c46848b55fde344fefe5a",
                        "Region": "ap-south-1"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "ap-south-1"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://rt56uofwmrgbbnjmzkxgn3bfga.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-fsjaxsmc5bb6rb443uvwtwghou",
                        "ClientDatabasePrefix": "caffae_API_KEY"
                    },
                    "caffae_AWS_IAM": {
                        "ApiUrl": "https://rt56uofwmrgbbnjmzkxgn3bfga.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "caffae_AWS_IAM"
                    },
                    "caffae_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://rt56uofwmrgbbnjmzkxgn3bfga.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "caffae_AMAZON_COGNITO_USER_POOLS"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-south-1:9d8ee499-4178-4b5e-915a-7c64bfa4b57e",
                            "Region": "ap-south-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-south-1_xMIA79dWK",
                        "AppClientId": "1uj29psgnmadq8ubhpo2jrejv9",
                        "Region": "ap-south-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "socialProviders": [],
                        "usernameAttributes": [],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "caffae-storage-f816c0ed151258-dev",
                        "Region": "ap-south-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "caffae-storage-f816c0ed151258-dev",
                "region": "ap-south-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';
