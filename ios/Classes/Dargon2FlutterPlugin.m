#import "Dargon2FlutterPlugin.h"
#import "argon2.h"

@implementation Dargon2FlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"dargon2_flutter"
            binaryMessenger:[registrar messenger]];
  Dargon2FlutterPlugin* instance = [[Dargon2FlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  //Call these all once in order to pass them through to flutter because it doesn't work otherwise
  argon2_hash(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x13);
  argon2_encodedlen(0, 0, 0, 0, 0, 0);
  argon2_verify(0, 0, 0, 0);
  argon2_error_message(0);
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
