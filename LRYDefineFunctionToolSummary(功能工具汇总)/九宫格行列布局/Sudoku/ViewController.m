//
//  ViewController.m
//  Sudoku
//
//  Created by 星星 on 16/8/19.
//  Copyright © 2016年 星星. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@implementation UIColor (Extensions)


+ (instancetype)randomColor {
    
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    return [self colorWithRed:red green:green blue:blue alpha:1.0];
}

@end

@interface ViewController ()

@property (nonatomic, weak) UIView *containerView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self onlyCountHandle];
    [self useMasonryHandle];
    

}

#pragma mark- masonry 技术
-(void)useMasonryHandle{
        UIView *containerView = [[UIView alloc] init];
        [self.view addSubview:containerView];
        self.containerView = containerView;
        containerView.backgroundColor = [UIColor whiteColor];
        containerView.layer.borderWidth = 1;
        containerView.layer.borderColor = [UIColor grayColor].CGColor;
  
    // 固定containerView的宽高
    // 宫格大小随着containerView的宽高而改变
        [self distributeDynamicCellWithCount:9 warp:3];
    
    // 固定containerView的宽
    // 宫格的宽随containerView的宽改变
    // 固定宫格的高
    // containerView的高随宫格的高改变
    // [self distributeDynamic2CellWithCount:13 warp:3];
    
    
    // 固定container大小
    // 固定宫格大小
    // [self distributeFixedCellWithCount:17 warp:4];
}


// 固定containerView的宽高
// 宫格大小随containerView的宽高改变
- (void)distributeDynamicCellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
        make.height.equalTo(280);
    }];
    
    for (int i = 0; i < count; i++) {
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor randomColor];
//        [self.containerView addSubview:view];
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor randomColor];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:btn];
    }
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0
                                                            fixedLineSpacing:10 fixedInteritemSpacing:20
                                                                   warpCount:3
                                                                  topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}

-(void)didClick:(UIButton *)sender{
    NSLog(@"点击了 === %ld",(long)sender.tag);
}


// 固定containerView的宽
// 宫格的宽随containerView的宽改变
// 固定宫格的高
// containerView的高随宫格的高改变
- (void)distributeDynamic2CellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
    }];
    
    for (int i = 0; i < count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [self.containerView addSubview:view];
    }
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:80
                                                            fixedLineSpacing:10 fixedInteritemSpacing:20
                                                                   warpCount:3
                                                                  topSpacing:10
                                                               bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}


// 固定container大小
// 固定宫格大小
- (void)distributeFixedCellWithCount:(NSUInteger)count warp:(NSUInteger)warp {
    
    [self.containerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [self.containerView remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(66);
        make.right.equalTo(-15);
        make.height.equalTo(300);
    }];
    
    for (int i = 0; i < count; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor randomColor];
        [self.containerView addSubview:view];
    }
    
    
    [self.containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:50 fixedItemHeight:50
                                                              warpCount:warp
                                                             topSpacing:10 bottomSpacing:10 leadSpacing:10 tailSpacing:10];
}


#pragma mark- 纯计算,不用 masonry
-(void)onlyCountHandle{
    //纯计算,不用 masonry
    
    int num = 8;
    
    int totals = 4;
    
    CGFloat demoW = 80;
    CGFloat demoH = 80;
    CGFloat margin = (self.view.frame.size.width - demoW*totals)/(totals+1);
    //CGFloat demoX = margin;
    //CGFloat demoY = margin;
    
    for (int i = 0 ; i < num; i++) {
        
        int row = i / totals;
        
        int colums = i % totals;
        //图片布局
        //        UIView * demo = [[UIView alloc]init];
        //        demo.frame = CGRectMake(margin + (margin + demoW)*colums, margin + (margin + demoH)*row, demoW, demoH);
        //        demo.layer.cornerRadius = 40;
        //        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5"]];
        //        imageView.backgroundColor = [UIColor randomColor];
        //        demo.clipsToBounds = YES;
        //        [demo addSubview:imageView];
        //        demo.backgroundColor = [UIColor redColor];
        //        [self.view addSubview:demo];
        //图片布局
        
        //按钮布局
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor randomColor];
        btn.frame = CGRectMake(margin + (margin + demoW)*colums, margin + (margin + demoH)*row, demoW, demoH);
        btn.layer.cornerRadius = 40;
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        //按钮布局
        
        
    }
    //纯计算,不用 masonry
}




@end



