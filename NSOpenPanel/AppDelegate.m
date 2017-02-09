//
//  AppDelegate.m
//  NSOpenPanel
//
//  Created by admin on 17/2/8.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
- (IBAction)panel:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseDirectories:YES];
    [panel setDirectoryURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Users/%@/Documents",NSUserName()]]];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:@[@"mov",@"mp4"]];
    [panel setAllowsMultipleSelection:NO];//多选
    [panel setMessage:@"Please select video to show."];
    if ([panel runModal] == NSModalResponseOK) {
        NSString *path = [panel.URLs.firstObject path];
        NSLog(@"%@",path);
    }
}
- (IBAction)panel2:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseDirectories:YES];
    [panel setCanChooseFiles:NO];
    panel.prompt = @"Choose";
    [panel setMessage:@"Please select a directory to show."];
    if ([panel runModal] == NSModalResponseOK) {
        NSString *path = [panel.URLs.firstObject path];
        NSLog(@"%@",path);
        //code
    }
}
- (IBAction)savePanel:(id)sender {
    NSSavePanel*    panel = [NSSavePanel savePanel];
    [panel setNameFieldStringValue:@"Untitle.iso"];
    [panel setMessage:@"Choose the path to save the document"];
    [panel setAllowsOtherFileTypes:YES];
    [panel setAllowedFileTypes:@[@"iso"]];
    [panel setDirectoryURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Users/%@/Documents",NSUserName()]]];
    [panel setExtensionHidden:YES];//后缀名，例如：@“iso”
    [panel setCanCreateDirectories:YES];
    [panel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton)
        {
            
            NSString *path = [[panel URL] path];
            NSLog(@"%@______",path);
            [@"iso" writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        
    }];
    

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
