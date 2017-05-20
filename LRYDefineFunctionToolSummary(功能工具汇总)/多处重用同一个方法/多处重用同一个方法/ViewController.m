//
//  ViewController.m
//  多处重用同一个方法
//
//  Created by ZE KANG on 2017/5/18.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "MyMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btn:(id)sender {
    [MyMethod myBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
