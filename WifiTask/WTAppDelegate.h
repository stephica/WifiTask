//
//  WTAppDelegate.h
//  WifiTask
//
//  Created by Brian Dittmer on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreWLAN/CoreWLAN.h>

@interface WTAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, retain) NSString *currentSSID; 

@end
