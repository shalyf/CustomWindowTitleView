//
//  AppDelegate.m
//  CustomWindowTitleView
//
//  Created by 易小川 on 15/9/3.
//  Copyright (c) 2015年 易小川. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

MainWindowController *mainWindowController;

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    if (!mainWindowController)
        mainWindowController = [[MainWindowController alloc] init];
    
    [mainWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
