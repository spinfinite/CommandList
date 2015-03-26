//
//  CLTableViewDataSource.h
//  CommandList
//
//  Created by Sergio Perez on 3/18/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CLTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;

@end
