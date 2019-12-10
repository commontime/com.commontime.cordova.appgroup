#import "AppGroup.h"

@implementation AppGroup

- (void) addConversation: (CDVInvokedUrlCommand*) command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to add conversation from unread list"];
    NSString *conversationId = [command.arguments objectAtIndex:0];
    @try {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:[NSString stringWithFormat:@"group.%@", [[NSBundle mainBundle] bundleIdentifier]]];
        NSMutableArray *unreadConversations = [defaults mutableArrayValueForKey:@"unreadConversations"];
        if (![unreadConversations containsObject:conversationId])
        {
            [unreadConversations addObject:conversationId];
            [defaults synchronize];
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {}
    @finally {}
    [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
}

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
- (void) add: (CDVInvokedUrlCommand*) command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to add data to the app group"];
    NSString *key = [command.arguments objectAtIndex:0];
    NSString *value = [command.arguments objectAtIndex:1];
    @try {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:[NSString stringWithFormat:@"group.%@", [[NSBundle mainBundle] bundleIdentifier]]];
        [defaults setObject:value forKey:key];
        [defaults synchronize];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {}
    @finally {}
    [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
}

- (void) remove: (CDVInvokedUrlCommand*) command
{
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to remove data from the app group"];
    NSString *key = [command.arguments objectAtIndex:0];
    @try {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:[NSString stringWithFormat:@"group.%@", [[NSBundle mainBundle] bundleIdentifier]]];
        [defaults removeObjectForKey:key];
        [defaults synchronize];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {}
    @finally {}
    [self.commandDelegate sendPluginResult: pluginResult callbackId:command.callbackId];
}

@end