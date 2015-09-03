//
//  MainWindowController.m
//  
//
//  Created by 易小川 on 15/9/3.
//
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (id)init {
    if ([super initWithWindowNibName:@"MainWindow"])
        return self;
    return nil;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
