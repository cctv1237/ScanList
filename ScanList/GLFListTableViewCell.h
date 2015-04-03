//
//  GLFListTableViewCell.h
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLFListFrame;
@interface GLFListTableViewCell : UITableViewCell

@property (nonatomic,strong) GLFListFrame *listFrame;

+ (instancetype)cellWithTableView:(UITableView *) tableView;

@end
