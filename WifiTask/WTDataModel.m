//
//  WTDataModel.m
//  WifiTask
//
//  Created by Brian Dittmer on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WTDataModel.h"
#import "NSFileManager+DirectoryLocations.h"

@implementation WTDataModel

@synthesize tasks = _tasks;

+ (WTDataModel *)loadOrCreate {

    WTDataModel *model = [[self init] alloc];
    NSString *configPath = [WTDataModel configPath];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:configPath]) {
        model.tasks = [NSMutableDictionary dictionaryWithContentsOfFile:configPath];
    } else {
        model.tasks = [NSMutableDictionary dictionaryWithCapacity:5];
        [model save];
    }
    
    return model;
}

+ (NSString *)configPath {
    return [[[NSFileManager defaultManager] applicationSupportDirectory] stringByAppendingPathComponent:@"config.plist"];
}

- (void)save {
    if (_tasks) {
        [_tasks writeToFile:[WTDataModel configPath] atomically:YES];
    }
}

- (void)dealloc {
    self.tasks = nil;
    [super dealloc];
}

@end
