//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_keyboard_visibility/KeyboardVisibilityPlugin.h>)
#import <flutter_keyboard_visibility/KeyboardVisibilityPlugin.h>
#else
@import flutter_keyboard_visibility;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTKeyboardVisibilityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTKeyboardVisibilityPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
}

@end
