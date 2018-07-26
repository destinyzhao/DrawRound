//
//  ViewController.m
//  DrawRound
//
//  Created by Destiny on 2018/7/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "RoundProgressView.h"

#define ScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight    [[UIScreen mainScreen] bounds].size.height


@interface ViewController ()

@property (strong, nonatomic) RoundProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView =[[RoundProgressView alloc]initWithFrame:CGRectMake((ScreenWidth - 200)/2, 100, 200, 200)];
    self.progressView.backgroundColor = [UIColor yellowColor];
    [self.progressView setProgressColor:[UIColor blueColor]];
    self.progressView.lineDashPattern = @[@(8),@(5)];
    self.progressView.progressFont = [UIFont systemFontOfSize:70];
    [self.view addSubview:self.progressView];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.progressView updateProgress:25];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
