//
//  CLTableViewDataSource.m
//  CommandList
//
//  Created by Sergio Perez on 3/18/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import "CLTableViewDataSource.h"

#import "CLCommands.h"

static NSString * const cellIdentifier = @"identifier";

@implementation CLTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [CLCommands count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [CLCommands titleAtIndex:indexPath.row];
    
    return cell;
    
}

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"inthinc.com";
}

@end
