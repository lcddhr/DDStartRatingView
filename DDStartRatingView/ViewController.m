//
//  ViewController.m
//  DDStartRatingView
//
//  Created by lovelydd on 14/11/6.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "ViewController.h"
#import "DDStartRatingView.h"

@interface ViewController ()<DDStartRatingViewDelegate>
{
    DDStartRatingView *_startView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _startView = [[DDStartRatingView alloc] initWithFrame:CGRectMake(20, 30, 280, 260) delegate:self];
    [self.view addSubview:_startView];
}

-(void)starRatingView:(DDStartRatingView *)view touchIndex:(int)index
{
    NSString *message = [NSString stringWithFormat:@"你选择的是第%d个星星",index];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
    
    [_startView updateCommitButtonTittle];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
