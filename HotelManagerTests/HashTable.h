//
//  HashTable.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/14/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

-(id)objectForKey:(NSString *)key;
-(id)removeObjectForKey:(NSString *)key;

@end
