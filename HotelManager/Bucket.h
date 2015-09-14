//
//  Bucket.h
//  HotelManager
//
//  Created by Sarah Hermanns on 9/14/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bucket : NSObject

@property (strong,nonatomic) Bucket *next;
@property (strong,nonatomic) NSString *key;
@property (strong,nonatomic) id value;

@end
