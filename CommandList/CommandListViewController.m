//
//  CommandListViewController.m
//  CommandList
//
//  Created by Sergio Perez on 3/18/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import "CommandListViewController.h"

#import "CLTableViewDataSource.h"

#import "CLCommands.h"

#import "CLDetailViewController.h"

@interface CommandListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // instantiates a table view
@property (nonatomic, strong) CLTableViewDataSource *dataSource; // Must be strong to stay in memory

@end

@implementation CommandListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Commands List";
    
    self.dataSource = [CLTableViewDataSource new];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.dataSource heightForIndexPath:indexPath];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CLDetailViewController *viewController = [CLDetailViewController new];
    viewController.commandIndex = indexPath.row;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
