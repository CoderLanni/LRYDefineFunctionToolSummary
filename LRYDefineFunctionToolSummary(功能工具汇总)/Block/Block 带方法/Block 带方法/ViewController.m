//
//  ViewController.m
//  Block 带方法
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
    
    
    self.view.backgroundColor = [UIColor yellowColor];


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MyViewController *tfVC = [[MyViewController alloc]init];;
    
    [tfVC returnText:^(NSString *showText) {
       NSLog(@"block 回来的只 ==== %@",showText) ;
    }];
    
    
    /**
     //第二种方法
    tfVC.myBlock = ^(NSString * name) {
        NSLog(@"回来的 === %@",name);
    };
    */
     
     
    [self.navigationController pushViewController:tfVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
