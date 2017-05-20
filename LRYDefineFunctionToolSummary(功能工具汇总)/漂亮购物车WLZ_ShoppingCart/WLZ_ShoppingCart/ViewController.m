//
//  ViewController.m
//  WLZ_ShoppingCart
//
//  Created by lijiarui on 15/12/10.
//  Copyright © 2015年 lijiarui. All rights reserved.
//

#import "ViewController.h"
#import "WLZ_ShoppingCarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
}



- (IBAction)goShoppingCar:(id)sender {
    
    
    WLZ_ShoppingCarController *car = [[WLZ_ShoppingCarController alloc]init];
    [self.navigationController pushViewController:car animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
