//
//  ViewController.m
//  封装一个搜索框
//
//  Created by peijz on 16/1/8.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+JZ.h"
#import "JZSearchBar.h"
#define myWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    JZSearchBar * searchBar = [JZSearchBar searchBar];
    
    searchBar.frame = CGRectMake(0, 0, myWidth - 20, 40);
    
    // 把searchbar赋给titleview
    self.navigationItem.titleView = searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
