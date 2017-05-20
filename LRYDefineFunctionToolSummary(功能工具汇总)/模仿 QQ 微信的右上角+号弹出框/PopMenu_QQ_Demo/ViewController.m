//
//  ViewController.m
//  PopMenu_QQ_Demo
//
//  Created by yuanxiaolong on 16/3/28.
//  Copyright © 2016年 yuanxiaolong. All rights reserved.
//

#import "ViewController.h"
#import "XLPopMenuViewModel.h"
#import "XLPopMenuViewSingleton.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(btnClick:)];
    
    
}


- (void)btnClick:(id)sender {
    
    if (!_arr)
    {
        _arr = [[NSMutableArray alloc] init];
        for (int i = 0; i < [self titles].count; i++) {
            XLPopMenuViewModel *model = [[XLPopMenuViewModel alloc] init];
            model.image = [self images][i];
            model.title = [self titles][i];
            [_arr addObject:model];
            
        }
        
    }
    // 弹出框的宽度
    CGFloat menuViewWidth = 150;
    // 弹出框的左上角起点坐标
    CGPoint startPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - menuViewWidth - 10, 64 + 12);
    
    [[XLPopMenuViewSingleton shareManager] creatPopMenuWithFrame:startPoint popMenuWidth:menuViewWidth popMenuItems:_arr action:^(NSInteger index) {
        
        NSLog(@"index= %ld",(long)index);
        
    }];
    
}

- (NSArray *)titles
{
    return @[@"扫一扫",
             @"加好友",
             @"创建讨论组",
             @"发送到电脑",
             @"面对面快传",
             @"收钱"];
}

- (NSArray *) images {
    return @[@"menu_QR",
             @"menu_addFri",
             @"menu_multichat",
             @"menu_sendFile",
             @"menu_facetoface",
             @"menu_payMoney"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
