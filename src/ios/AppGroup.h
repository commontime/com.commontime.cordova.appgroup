#import <Cordova/CDV.h>

@interface AppGroup : CDVPlugin

- (void) addConversation:(CDVInvokedUrlCommand*)command;
- (void) removeConversation:(CDVInvokedUrlCommand*)command;
- (void) setApplicationBadgeNumber:(CDVInvokedUrlCommand*)command;
- (void) add:(CDVInvokedUrlCommand*)command;
- (void) remove:(CDVInvokedUrlCommand*)command;

@end