//
//  WTDataModel.h
//  WifiTask
//
//  Created by Brian Dittmer on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTDataModel : NSObject

+ (WTDataModel *)loadOrCreate;

@property (nonatomic, retain) NSMutableDictionary *tasks;

@end
