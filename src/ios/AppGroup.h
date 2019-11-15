#import <Cordova/CDV.h>

@interface AppGroup : CDVPlugin

- (void) removeConversation:(CDVInvokedUrlCommand*)command;
- (void) setApplicationBadgeNumber: (CDVInvokedUrlCommand*) command;

@end