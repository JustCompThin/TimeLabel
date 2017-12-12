//
//  ViewController.m
//  TimeLabel
//
//  Created by JustCompareThin on 2017/12/12.
//  Copyright © 2017年 JustCompareThin. All rights reserved.
//

#import "ViewController.h"

#import "TimeLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    CGFloat kScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat kScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    TimeLabel *timeLabel = [[TimeLabel alloc] initWityFrame:CGRectMake(kScreenWidth * .5 - 100, 100, 200, 20) type:TIME_HOUR_MINUTE_SECOND timeChange:^(NSInteger time) {
        NSLog(@"%ld",(long)time);
    } timeEnd:^{
        NSLog(@"倒计时结束");
    }];
    
    [self.view addSubview:timeLabel];
    
    [timeLabel setcurentTime:60 * 60 * 20];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
