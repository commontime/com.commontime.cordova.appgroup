#import "AppGroup.h"

@implementation AppGroup

- (void) removeConversation: (CDVInvokedUrlCommand*) command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to remove conversation from unread list"];
    NSString *conversationId = [command.arguments objectAtIndex:0];
    @try {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:[NSString stringWithFormat:@"group.%@", [[NSBundle mainBundle] bundleIdentifier]]];
        NSMutableArray *unreadConversations = [defaults mutableArrayValueForKey:@"unreadConversations"];
        if ([unreadConversations containsObject:conversationId])
        {
            [unreadConversations removeObject:conversationId];
            [defaults synchronize];
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {}
    @finally {}
    [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
}

- (void) setApplicationBadgeNumber: (CDVInvokedUrlCommand*) command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to update application badge number"];
    NSInteger newBadgeNumber = [[command.arguments objectAtIndex:0] integerValue];
    @try {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:[NSString stringWithFormat:@"group.%@", [[NSBundle mainBundle] bundleIdentifier]]];
        [defaults setInteger:newBadgeNumber forKey:@"applicationBadgeNumber"];
        [defaults synchronize];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {}
    @finally {}    
    [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
}

@end