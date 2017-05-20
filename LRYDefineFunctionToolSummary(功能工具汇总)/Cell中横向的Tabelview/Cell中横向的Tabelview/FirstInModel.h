//
//  FirstInModel.h
//  Cell中横向的Tabelview
//
//  Created by ZE KANG on 2017/5/10.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstInModel : NSObject
@property (nonatomic, strong) NSString *goodsPhotoId1;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *specifications;
@property (nonatomic, assign) double buyNumber;
@property (nonatomic, strong) NSString *doctorId;
@property (nonatomic, strong) NSString *goodsPrice;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, assign) double orderType;
@property (nonatomic, strong) NSString *goodsMmoney;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
@end
