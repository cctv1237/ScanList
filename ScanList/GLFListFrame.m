//
//  GLFListFrame.m
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import "GLFListFrame.h"
#import "GLFListData.h"
#define NameFont [UIFont systemFontOfSize:15]
#define textFont [UIFont systemFontOfSize:16]

@implementation GLFListFrame

- (void)setListData:(GLFListData *)listData{
    _listData = listData;
    
    //padding
    CGFloat padding = 10;
    
    //set frame of picture
    CGFloat pictureViewWidth = 300;
    CGFloat pictureViewHeight = 300;
    CGFloat pictureViewX = padding;
    CGFloat pictureViewY = padding;
    
    self.pictureFrame = CGRectMake(pictureViewX, pictureViewY, pictureViewWidth, pictureViewHeight);
    
    //set frame of icon
    CGFloat iconViewWidth = 30;
    CGFloat iconViewHeight = 30;
    CGFloat iconViewX = padding + (pictureViewWidth - iconViewWidth);
    CGFloat iconViewY = CGRectGetMaxY(self.pictureFrame) + padding;
    
    self.iconFrame = CGRectMake(iconViewX, iconViewY, iconViewWidth, iconViewHeight);
    
    //set frame of name
    
    //set size of name
    CGSize nameSize = [self sizeWithString:_listData.name font:NameFont textMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    CGFloat nameViewWidth = nameSize.width;
    CGFloat nameViewHeight = nameSize.height;
    CGFloat nameViewX = CGRectGetMidX(self.iconFrame) - nameViewWidth - padding;
    CGFloat nameViewY = iconViewY - (iconViewHeight - nameViewHeight) * 0.5;
    
    self.nameFrame = CGRectMake(nameViewX, nameViewY, nameViewWidth, nameViewHeight);
    
    //set size of vip
    CGFloat vipViewWidth = 14;
    CGFloat vipViewHeight = 14;
    CGFloat vipViewX = CGRectGetMidX(self.nameFrame) - vipViewWidth - padding;
    CGFloat vipViewY = nameViewY;
    
    self.pictureFrame = CGRectMake(vipViewX, vipViewY, vipViewWidth, vipViewHeight);
    
    //set size of text
    if (listData.text) {
        //include text
        
        //set size of text
        CGSize textSize = [self sizeWithString:_listData.text font:textFont textMaxSize:CGSizeMake(300, MAXFLOAT)];
        
        CGFloat textViewWidth = textSize.width;
        CGFloat textViewHeight = textSize.height;
        CGFloat textViewX = padding;
        CGFloat textViewY = CGRectGetMaxY(self.iconFrame) + padding;
        
        self.textFrame = CGRectMake(textViewX, textViewY, textViewWidth, textViewHeight);
        
        //set the height of cell
        self.cellHeight = CGRectGetMaxY(self.textFrame) + padding;
    }
    else{
        //exclude text
        //set the height of cell
        self.cellHeight = CGRectGetMaxY(self.iconFrame) + padding;
    }
    


}
/**
 *  Calculate text height and width
 *
 *  @param textString  text
 *  @param font        font
 *  @param textMaxSize max size of text
 *
 *  @return size of text
 */
-(CGSize)sizeWithString:(NSString *)textString font:(UIFont *)font textMaxSize:(CGSize) textMaxSize{
    
    NSDictionary *fontDict = @{NSFontAttributeName: font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size = [textString boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil].size;
    return size;
    
}

@end
