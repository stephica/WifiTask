//
//  WTAppDelegate.m
//  WifiTask
//
//  Created by Brian Dittmer on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WTAppDelegate.h"

@implementation WTAppDelegate

@synthesize currentSSID = _currentSSID;

- (void)dealloc {
    self.currentSSID = nil;
    
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(handleSSIDChange:) 
                                                 name:CWSSIDDidChangeNotification object:nil]; 
    
    self.currentSSID = [self determineSSID];
}

- (void)handleSSIDChange:(NSNotification *)notification {
    NSString *newSSID = [self determineSSID];
    
    if(![_currentSSID isEqualToString:newSSID]) {
        
    }
}

- (NSString *)determineSSID {
    // TODO: [CWInterface interfaceNames] returns a set of WLAN capable interfaces, so standard ethernet, etc. is not
    // included. Need to figure out if/when interfaceNames will return a set with > 1 interface.
    CWInterface *interface = [CWInterface interfaceWithName:[[CWInterface interfaceNames] anyObject]];
    return interface.ssid;
}

@end
