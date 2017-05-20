//
//  ViewController.m
//  Demo
//
//  Created by 刘荣毅 on 2017/5/18.
//  Copyright © 2017年 Liu. All rights reserved.
//

#import "ViewController.h"
#import "RYToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)defaultToast:(UIButton *)sender
{
    [RYToast showWithText:@"默认持续2秒，在屏幕中间"];
}

- (IBAction)durationToast:(UIButton *)sender
{
    [RYToast showWithText:@"持续3秒，在屏幕中间" duration:3.0f];
}

- (IBAction)topOffsetToast:(UIButton *)sender
{
    [RYToast showWithText:@"距离顶部50" topOffset:50.0f];
}

- (IBAction)topOffsetAndDuration:(UIButton *)sender
{
    [RYToast showWithText:@"距离顶部100,持续3秒" topOffset:100.0f duration:3.0f];
}

- (IBAction)bottomToast:(UIButton *)sender
{
    [RYToast showWithText:@"距离底部50" bottomOffset:50.0f];
}

- (IBAction)bottomAndDuration:(UIButton *)sender
{
    [RYToast showWithText:@"距离底部100,持续3秒" bottomOffset:100.0f duration:3.0f];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
