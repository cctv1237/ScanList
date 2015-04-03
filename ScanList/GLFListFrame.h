//
//  GLFListFrame.h
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GLFListData;
@interface GLFListFrame : NSObject

/**
 *  Frame of every objects
 */
@property (nonatomic,assign) CGRect iconFrame;
@property (nonatomic,assign) CGRect nameFrame;
@property (nonatomic,assign) CGRect vipFrame;
@property (nonatomic,assign) CGRect textFrame;
@property (nonatomic,assign) CGRect pictureFrame;
@property (nonatomic,assign) CGFloat cellHeight;
/**
 *  model data
 */
@property (nonatomic,strong) GLFListData *listData;

@end
