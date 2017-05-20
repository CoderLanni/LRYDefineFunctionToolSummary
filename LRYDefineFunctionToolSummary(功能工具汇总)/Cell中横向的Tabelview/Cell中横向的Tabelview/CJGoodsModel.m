//
//  CJGoodsModel.m
//  MyDoctor
//  Created by 刘荣毅 on 2017/1/10.
//  Copyright © 2017年 Change. All rights reserved.

#import "CJGoodsModel.h"

@interface CJGoodsModel ()


@end

@implementation CJGoodsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.buyNumber = [dict[@"buyNumber"] integerValue];
        self.date = dict[@"date"];
        self.goodsMmoney = [dict[@"goodsMmoney"] integerValue];
        self.integralPoint = [dict[@"integralPoint"] integerValue];
        self.integralType = [dict[@"integralType"] integerValue];
        self.list = dict[@"list"];
        self.orderId = dict[@"orderId"];
        self.orderType = [dict[@"orderType"] integerValue];
        
    }
    return self;
}

+(instancetype)setModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
