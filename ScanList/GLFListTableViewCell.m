//
//  GLFListTableViewCell.m
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import "GLFListTableViewCell.h"
#import "GLFListFrame.h"
#import "GLFListData.h"
#define NameFont [UIFont systemFontOfSize:15]
#define textFont [UIFont systemFontOfSize:16]

@interface GLFListTableViewCell()

//picture
@property (nonatomic,weak) UIImageView *pictureView;
//icon
@property (nonatomic,weak) UIImageView *iconView;
//name
@property (nonatomic,weak) UILabel *nameLable;
//vip
@property (nonatomic,weak) UIImageView *vipView;
//text
@property (nonatomic,weak) UILabel *mainTextLabel;

@end

@implementation GLFListTableViewCell


+ (instancetype)cellWithTableView:(UITableView *) tableView{
    //set identifier
    static NSString *identifier = @"listStatus";
    //load from buffer
    GLFListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //set cell
    if (cell == nil) {
        cell = [[GLFListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

/**
 *  override init method
 *
 *  @param style           style default
 *  @param reuseIdentifier identifier
 *
 *  @return self
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    //set picture
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self.contentView addSubview:pictureView];
    self.pictureView = pictureView;
    
    //set icon
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    //set name
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.font = NameFont;
    [self.contentView addSubview:nameLable];
    self.nameLable = nameLable;
    
    //set vip
    UIImageView *vipView = [[UIImageView alloc] init];
    [self.contentView addSubview:vipView];
    self.vipView = vipView;
    
    //set text
    UILabel *mainTextLable = [[UILabel alloc] init];
    mainTextLable.font = textFont;
    mainTextLable.numberOfLines = 0;
    [self.contentView addSubview:mainTextLable];
    self.mainTextLabel = mainTextLable;
    
    return self;
}

/**
 *  override setListFrame
 *
 *  @param listFrame listFrame
 */
- (void)setListFrame:(GLFListFrame *)listFrame{
    _listFrame = listFrame;
    
    //set data
    [self settingData];
    //set frame
    [self settingFrame];
}


/**
 *  setting data for each widght
 */
- (void)settingData{
    GLFListData *listData = self.listFrame.listData;
    
    //set picture
    self.pictureView.image = [UIImage imageNamed:listData.picture];
    //set icon
    self.iconView.image = [UIImage imageNamed:listData.icon];
    //set name
    self.nameLable.text = listData.name;
    //set vip
    self.vipView.image = [UIImage imageNamed:@"vip"];
    if (listData.vip) {
        self.nameLable.textColor = [UIColor redColor];
        self.vipView.hidden = NO;
    }else{
        self.nameLable.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    //set text
    if (listData.text) {
        self.mainTextLabel.text = listData.text;
        self.mainTextLabel.hidden = NO;
    }else{
        self.mainTextLabel.hidden = YES;
    }
}

/**
 *  setting frame for each widght
 */
- (void)settingFrame{
    //set picture
    self.pictureView.frame = self.listFrame.pictureFrame;
    //set icon
    self.iconView.frame = self.listFrame.iconFrame;
    //set name
    self.nameLable.frame = self.listFrame.nameFrame;
    //set vip
    self.vipView.frame = self.listFrame.vipFrame;
    //set text
    if (self.listFrame.listData.text) {
        self.mainTextLabel.frame = self.listFrame.textFrame;
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
