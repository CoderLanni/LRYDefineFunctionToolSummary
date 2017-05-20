//
//  JZSearchBar.m
//  封装一个搜索框
//
//  Created by peijz on 16/1/8.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import "JZSearchBar.h"
#import "UIImage+JZ.h"
@implementation JZSearchBar

+(instancetype)searchBar
{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        // 设置背景图片
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background_os7@2x"];
        
        // 设置圆角
        self.layer.cornerRadius = 5;
        
        // 设置字体
        self.font = [UIFont systemFontOfSize:12];
        
        
        // 设置清楚按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        
        // 设置默认提示文字
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        dict[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:dict];

        
        /**
         * 左边放大镜图标
         */
        UIImageView * iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon@2x"]];
        
        // 让放大镜图片居中
        iconView.contentMode = UIViewContentModeCenter;
        // 把放大镜赋值给leftview
        self.leftView = iconView;
        // 让leftview显示
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    // 设置左侧图片的frame
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}

@end
