//
//  FirstViewController.m
//  在 VC 中添加 View or VC
//
//  Created by ZE KANG on 2017/5/11.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}

-(void)creatUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor yellowColor];
    btn.frame = CGRectMake(50, 50, 50,40);
    [btn addTarget:self action:@selector(didTApBtnHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)didTApBtnHandle{
    
    NSLog(@"输出 ");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
