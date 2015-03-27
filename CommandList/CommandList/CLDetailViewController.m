//
//  CLDetailViewController.m
//  CommandList
//
//  Created by Sergio Perez on 3/19/15.
//  Copyright (c) 2015 Learning iOS Development. All rights reserved.
//

#import "CLDetailViewController.h"

#import "CLCommands.h"

static CGFloat margin = 15;

@interface CLDetailViewController ()

@end

@implementation CLDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [CLCommands titleAtIndex:self.commandIndex];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 20;
    
    // We need to calculate the height of the description because it's going to cover more than one line.
    
    CGFloat heightForDescription = [self heightForDescription:[CLCommands descriptionAtIndex:self.commandIndex]];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width -2 * margin, heightForDescription)];
    description.text = [CLCommands descriptionAtIndex:self.commandIndex];
    
    // By setting numberOfLines = 0 it will let us have as many lines as we need.
    description.numberOfLines = 0;
    [scrollView addSubview:description];
    
    // Shift the top margin with every label we add to the scrollview
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    UILabel *commandsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    commandsTitle.text = @"Commands";
    commandsTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:commandsTitle];
    
    top += 20 + margin;
    
    for (int i = 0; i < [CLCommands commandCountStepsAtIndex:self.commandIndex]; i++){
        
        // I set the width of the volume to 1/4 of the screen (less margins). You can set it to whatever width you want. The best thing to do would be to find the maximum width of all ingredient volumes.
        
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) / 4, 20)];
        volume.font = [UIFont boldSystemFontOfSize:17];
        volume.text = [CLCommands commandScopeAtIndex:i comAtIndex:self.commandIndex];
        
        [scrollView addSubview:volume];
        
        // The width of the type is just the remaining space. It's possible that this get's truncated, because I'm not wrapping text here.
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin) / 4, top, (self.view.frame.size.width - 2 * margin) * 3 / 4, 20)];
        type.numberOfLines = 0;
        type.font = [UIFont systemFontOfSize:15];
        type.text = [CLCommands commandTypeAtIndex:i comAtIndex:self.commandIndex];
        
        [scrollView addSubview:type];
        
        // Volume and type are on the same line, so we only update the top margin after they are added to the scrollview
        
        top += (20 + margin);
        
    }
    
    top += margin;
    
    UILabel *descriptionTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    descriptionTitle.text = @"Description";
    descriptionTitle.font = [UIFont boldSystemFontOfSize:17];
    [scrollView addSubview:descriptionTitle];
    
    top += 20 + margin;
    
    
    for (int i = 0; i < [[CLCommands howToAtIndex:self.commandIndex] count]; i++) {
        
        CGFloat height = [self heightForDirections:[CLCommands howToAtIndex:self.commandIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        direction.numberOfLines = 0;
        direction.text = [CLCommands howToAtIndex:self.commandIndex][i];
        
        [scrollView addSubview:direction];
        
        top += (height + margin);
        
    }
    
    // We set the content size of the scrollview after we've added all the labels so that we know how tall the size needs to be.
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
    
 
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)heightForDescription:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
}

- (CGFloat)heightForDirections:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
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
