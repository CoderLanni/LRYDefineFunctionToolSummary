//
//  SearchRecordTableViewCell.m
//  搜索信息
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 yiqing. All rights reserved.
//

#import "SearchRecordTableViewCell.h"

@implementation SearchRecordTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat Width = [UIScreen mainScreen].bounds.size.width;
        self.lableText = [[UILabel alloc]initWithFrame:CGRectMake(15, 15,Width-30, 15)];
        self.lableText.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.lableText];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
