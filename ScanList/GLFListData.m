//
//  GLFListData.m
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import "GLFListData.h"

@implementation GLFListData

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)listWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
