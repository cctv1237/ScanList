//
//  GLFTableViewController.m
//  ScanList
//
//  Created by LF on 15/4/3.
//  Copyright (c) 2015年 FAN LONG. All rights reserved.
//

#import "GLFTableViewController.h"
#import "GLFListTableViewCell.h"
#import "GLFListFrame.h"
#import "GLFListData.h"

@interface GLFTableViewController ()

@property (nonatomic,strong) NSArray *stausFrame;

@end

@implementation GLFTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.stausFrame.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //set cell value form cell
    GLFListTableViewCell *cell = [GLFListTableViewCell cellWithTableView:tableView];
    // Configure the cell...
    cell.listFrame = self.stausFrame[indexPath.row];
    
    return cell;
}


#pragma mark - Lazy Loading

- (NSArray *)stausFrame{
    //NSLog(@"Lazy Loading");
    if (_stausFrame == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            
            //set models
            GLFListData *listData = [GLFListData listWithDict:dict];
            
            //set frame from models
            GLFListFrame *listFrame = [[GLFListFrame alloc] init];
            listFrame.listData = listData;
            
            [models addObject:listFrame];
        }
        self.stausFrame = [models copy];
    }
    return _stausFrame;
}


#pragma mark - Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //frame model for row
    GLFListFrame *listFrame = self.stausFrame[indexPath.row];
    return listFrame.cellHeight;
    
}




@end
