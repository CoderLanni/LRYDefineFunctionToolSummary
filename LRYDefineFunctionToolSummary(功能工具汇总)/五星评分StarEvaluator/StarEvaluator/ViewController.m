//
//  ViewController.m
//  StarEvaluator
//
//  Created by Mac on 16/4/27.
//  Copyright © 2016年 jyb. All rights reserved.
//

#import "ViewController.h"
#import "StarEvaluator.h"
#import "AnotherStarEvaluator.h"

@interface ViewController ()<StarEvaluatorDelegate,AnotherStarEvaluatorDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:0.7 blue:0.8 alpha:1];
    
    
    /** 带边框星星 **/
    StarEvaluator *star = [[StarEvaluator alloc] initWithFrame:CGRectMake(20, 150, 335, 70)];
    star.delegate = self;
    star.animate = YES;
    [self.view addSubview:star];
    
    
    /** 不带边框星星 **/
    AnotherStarEvaluator *star1 = [[AnotherStarEvaluator alloc] initWithFrame:CGRectMake(20, 350, 335, 70)];
    star1.delegate = self;
    [self.view addSubview:star1];
    
}

- (void)starEvaluator:(StarEvaluator *)evaluator currentValue:(float)value
{
    _label1.text = [NSString stringWithFormat:@"评价:%.1f",value];
}

- (void)anotherStarEvaluator:(AnotherStarEvaluator *)evaluator currentValue:(float)value
{
    _label2.text = [NSString stringWithFormat:@"评价:%.1f",value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
