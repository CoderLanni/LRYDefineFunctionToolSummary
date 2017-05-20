//
//  ViewController.m
//  封装验证码
//
//  Created by 纵索科技 on 16/4/23.
//  Copyright © 2016年 贺乾龙. All rights reserved.
//

#import "ViewController.h"

#import "IdenCodeViewController.h"

#import "Masonry.h"

@interface ViewController (){
    
    IdenCodeViewController *codeVC;
}


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    codeVC = [[IdenCodeViewController alloc]init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 35)];
    
    [button setTitle: @"获取验证码" forState:UIControlStateNormal];
    
    [button setBackgroundColor:[UIColor grayColor]];
    
    [button addTarget:self action:@selector(btnAcction) forControlEvents:UIControlEventTouchUpInside] ;
    
    [self.view addSubview:button];

    

}

-(void)btnAcction{

    
    [codeVC identyCode];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
