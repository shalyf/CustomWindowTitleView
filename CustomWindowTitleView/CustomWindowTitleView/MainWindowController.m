//
//  MainWindowController.m
//  
//
//  Created by 易小川 on 15/9/3.
//
//

#import "MainWindowController.h"

@interface MainWindowController ()
@property (strong) IBOutlet NSView *viewCustom;

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
    
    NSWindow *window = self.window;
    
    [window center];
    
    window.movableByWindowBackground = YES;
    window.titleVisibility = NSWindowTitleHidden;
    window.titlebarAppearsTransparent = YES;
    
    NSView *themeView = [window.contentView superview];
    
    if (NSAppKitVersionNumber <= NSAppKitVersionNumber10_9) {
        
        [themeView addSubview:self.viewCustom positioned:NSWindowBelow relativeTo:nil];
        
    } else {
        
        NSTitlebarAccessoryViewController *vc = [[NSTitlebarAccessoryViewController alloc] init];
        vc.view = [[NSView alloc] initWithFrame:((NSView *)window.contentView).frame];
        [window addTitlebarAccessoryViewController:vc];
        
        NSView *containerView = themeView.subviews[1];
        [containerView addSubview:self.viewCustom positioned:NSWindowBelow relativeTo:nil];
        
    }

}

@end
