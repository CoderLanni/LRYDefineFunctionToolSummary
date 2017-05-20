//
//  AppearView.m
//  在 VC 中添加 View or VC
//
//  Created by ZE KANG on 2017/5/11.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "AppearView.h"
#import "MainTableViewController.h"

@implementation AppearView

-(instancetype)initWithFrame:(CGRect)frame{
    [self superview];
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        [self creatUI];
    }
    return self;
}

//-(void)creatUI{
//    
//   self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.btn.backgroundColor = [UIColor purpleColor];
//    self.btn.frame = CGRectMake(50, 50, 50,40);
//    [self addSubview:self.btn];
//    
//}
-(void)creatUI{
    int num = 8;
    
    int totals = 4;
    
    CGFloat demoW = 80;
    CGFloat demoH = 80;
    CGFloat margin = (self.frame.size.width - demoW*totals)/(totals+1);
    //CGFloat demoX = margin;
    //CGFloat demoY = margin;
    
    for (int i = 0 ; i < num; i++) {
        
        int row = i / totals;
        
        int colums = i % totals;
        
        
        //按钮布局
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(margin + (margin + demoW)*colums, margin + (margin + demoH)*row, demoW, demoH);
        btn.layer.cornerRadius = 40;
        btn.tag = 100+i;
        [self addSubview:btn];
        
        //按钮布局
        
        
    }
}

@end
