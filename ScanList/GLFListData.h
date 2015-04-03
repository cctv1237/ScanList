//
//  GLFListData.h
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLFListData : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *picture;
@property (nonatomic,assign) BOOL vip;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)listWithDict:(NSDictionary *)dict;


@end
