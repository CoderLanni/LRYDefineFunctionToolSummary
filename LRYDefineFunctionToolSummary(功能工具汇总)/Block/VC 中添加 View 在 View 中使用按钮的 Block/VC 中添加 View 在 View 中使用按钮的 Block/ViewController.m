//
//  ViewController.m
//  VC 中添加 View 在 View 中使用按钮的 Block
//
//  Created by ZE KANG on 2017/5/16.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
@property(nonatomic, strong) MyView *myView ;
@end

@implementation ViewController
-(void)viewWillDisappear:(BOOL)animated{
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initUI{
    
    if (!_myView) {
        _myView = [[MyView  alloc]initWithFrame:CGRectMake(0, 0, 300, 250)];
        
        
       
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
