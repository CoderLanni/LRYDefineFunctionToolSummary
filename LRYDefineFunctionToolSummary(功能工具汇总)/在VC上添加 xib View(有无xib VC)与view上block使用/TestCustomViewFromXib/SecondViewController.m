//
//  SecondViewController.m
//  TestCustomViewFromXib
//
//  Created by 刘荣毅 on 2017/5/16.
//  Copyright © 2017年 Enuice_Wang. All rights reserved.
//

#import "SecondViewController.h"
#import "TwoView.h"

@interface SecondViewController ()
@property(nonatomic ,strong) TwoView *twoView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"2";
    self.view.backgroundColor = [UIColor whiteColor];
    if (!_twoView) {
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(30, 100, 300, 250)];
        
        _twoView = [[[NSBundle mainBundle] loadNibNamed:@"TwoView" owner:self options:nil] lastObject];
        _twoView.frame = CGRectMake(30, 100, 300, 250);
       
        [self.view addSubview:_twoView];
      _twoView.SelectedRoomBlock = ^{
           NSLog(@"点击View上Btn");
      };
        
        [self.view addSubview:_twoView];
    }

    
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
