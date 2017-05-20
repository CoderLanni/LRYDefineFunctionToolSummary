//
//  ViewController.m
//  Block 的传值
//
//  Created by ZE KANG on 2017/5/15.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"1";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MyViewController *vc =[[MyViewController alloc]init];
    // 回调修改颜色
    vc.backgroundColor = ^(UIColor *color){
        self.view.backgroundColor = color;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
