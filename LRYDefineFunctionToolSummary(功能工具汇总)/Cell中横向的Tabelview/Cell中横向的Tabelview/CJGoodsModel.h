//
//  CJGoodsModel.h
//  MyDoctor
//
//  Created by 刘荣毅 on 2017/1/10.
//  Copyright © 2017年 Change. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJGoodsModel : NSObject

/**
 buyNumber
 */
@property(nonatomic,assign)NSInteger buyNumber;

/**
 date
 */
@property(nonatomic,strong)NSString *date;

/**
 goodsMmoney
 */
@property(nonatomic,assign)NSInteger goodsMmoney;

/**
 integralPoint
 */
@property(nonatomic,assign)NSInteger integralPoint;

/**
 integralType
 */
@property(nonatomic,assign)NSInteger integralType;

/**
 list
 */
@property(nonatomic,strong)NSArray *list;

/**
 orderId
 */
@property(nonatomic,strong)NSString *orderId;

/**
 orderType
 */
@property(nonatomic,assign)NSInteger orderType;

+(instancetype)setModelWithDict:(NSDictionary *)dict;
@end
