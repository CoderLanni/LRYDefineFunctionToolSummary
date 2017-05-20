//
//  ViewController.m
//  Cell中横向的Tabelview
//
//  Created by ZE KANG on 2017/5/10.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)DidTapFirstTabelViewHandel:(id)sender {
    
    FirstTableViewController *firstVC = [[FirstTableViewController alloc]init];
    [self.navigationController pushViewController:firstVC animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
