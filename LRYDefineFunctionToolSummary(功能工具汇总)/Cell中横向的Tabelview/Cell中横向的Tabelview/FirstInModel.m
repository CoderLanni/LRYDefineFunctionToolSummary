//
//  FirstInModel.m
//  Cell中横向的Tabelview
//
//  Created by ZE KANG on 2017/5/10.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "FirstInModel.h"


NSString *const kBaseClassGoodsPhotoId1 = @"goodsPhotoId1";
NSString *const kBaseClassOrderId = @"orderId";
NSString *const kBaseClassGoodsName = @"goodsName";
NSString *const kBaseClassGoodsId = @"goodsId";
NSString *const kBaseClassSpecifications = @"specifications";
NSString *const kBaseClassBuyNumber = @"buyNumber";
NSString *const kBaseClassDoctorId = @"doctorId";
NSString *const kBaseClassGoodsPrice = @"goodsPrice";
NSString *const kBaseClassCreateDate = @"createDate";
NSString *const kBaseClassOrderType = @"orderType";
NSString *const kBaseClassGoodsMmoney = @"goodsMmoney";


@interface FirstInModel ()
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstInModel


@synthesize goodsPhotoId1 = _goodsPhotoId1;
@synthesize orderId = _orderId;
@synthesize goodsName = _goodsName;
@synthesize goodsId = _goodsId;
@synthesize specifications = _specifications;
@synthesize buyNumber = _buyNumber;
@synthesize doctorId = _doctorId;
@synthesize goodsPrice = _goodsPrice;
@synthesize createDate = _createDate;
@synthesize orderType = _orderType;
@synthesize goodsMmoney = _goodsMmoney;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.goodsPhotoId1 = [self objectOrNilForKey:kBaseClassGoodsPhotoId1 fromDictionary:dict];
        self.orderId = [self objectOrNilForKey:kBaseClassOrderId fromDictionary:dict];
        self.goodsName = [self objectOrNilForKey:kBaseClassGoodsName fromDictionary:dict];
        self.goodsId = [self objectOrNilForKey:kBaseClassGoodsId fromDictionary:dict];
        self.specifications = [self objectOrNilForKey:kBaseClassSpecifications fromDictionary:dict];
        self.buyNumber = [[self objectOrNilForKey:kBaseClassBuyNumber fromDictionary:dict] doubleValue];
        self.doctorId = [self objectOrNilForKey:kBaseClassDoctorId fromDictionary:dict];
        self.goodsPrice = [self objectOrNilForKey:kBaseClassGoodsPrice fromDictionary:dict];
        self.createDate = [self objectOrNilForKey:kBaseClassCreateDate fromDictionary:dict];
        self.orderType = [[self objectOrNilForKey:kBaseClassOrderType fromDictionary:dict] doubleValue];
        self.goodsMmoney = [self objectOrNilForKey:kBaseClassGoodsMmoney fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsPhotoId1 forKey:kBaseClassGoodsPhotoId1];
    [mutableDict setValue:self.orderId forKey:kBaseClassOrderId];
    [mutableDict setValue:self.goodsName forKey:kBaseClassGoodsName];
    [mutableDict setValue:self.goodsId forKey:kBaseClassGoodsId];
    [mutableDict setValue:self.specifications forKey:kBaseClassSpecifications];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyNumber] forKey:kBaseClassBuyNumber];
    [mutableDict setValue:self.doctorId forKey:kBaseClassDoctorId];
    [mutableDict setValue:self.goodsPrice forKey:kBaseClassGoodsPrice];
    [mutableDict setValue:self.createDate forKey:kBaseClassCreateDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderType] forKey:kBaseClassOrderType];
    [mutableDict setValue:self.goodsMmoney forKey:kBaseClassGoodsMmoney];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.goodsPhotoId1 = [aDecoder decodeObjectForKey:kBaseClassGoodsPhotoId1];
    self.orderId = [aDecoder decodeObjectForKey:kBaseClassOrderId];
    self.goodsName = [aDecoder decodeObjectForKey:kBaseClassGoodsName];
    self.goodsId = [aDecoder decodeObjectForKey:kBaseClassGoodsId];
    self.specifications = [aDecoder decodeObjectForKey:kBaseClassSpecifications];
    self.buyNumber = [aDecoder decodeDoubleForKey:kBaseClassBuyNumber];
    self.doctorId = [aDecoder decodeObjectForKey:kBaseClassDoctorId];
    self.goodsPrice = [aDecoder decodeObjectForKey:kBaseClassGoodsPrice];
    self.createDate = [aDecoder decodeObjectForKey:kBaseClassCreateDate];
    self.orderType = [aDecoder decodeDoubleForKey:kBaseClassOrderType];
    self.goodsMmoney = [aDecoder decodeObjectForKey:kBaseClassGoodsMmoney];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_goodsPhotoId1 forKey:kBaseClassGoodsPhotoId1];
    [aCoder encodeObject:_orderId forKey:kBaseClassOrderId];
    [aCoder encodeObject:_goodsName forKey:kBaseClassGoodsName];
    [aCoder encodeObject:_goodsId forKey:kBaseClassGoodsId];
    [aCoder encodeObject:_specifications forKey:kBaseClassSpecifications];
    [aCoder encodeDouble:_buyNumber forKey:kBaseClassBuyNumber];
    [aCoder encodeObject:_doctorId forKey:kBaseClassDoctorId];
    [aCoder encodeObject:_goodsPrice forKey:kBaseClassGoodsPrice];
    [aCoder encodeObject:_createDate forKey:kBaseClassCreateDate];
    [aCoder encodeDouble:_orderType forKey:kBaseClassOrderType];
    [aCoder encodeObject:_goodsMmoney forKey:kBaseClassGoodsMmoney];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstInModel *copy = [[FirstInModel alloc] init];
    
    if (copy) {
        
        copy.goodsPhotoId1 = [self.goodsPhotoId1 copyWithZone:zone];
        copy.orderId = [self.orderId copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
        copy.specifications = [self.specifications copyWithZone:zone];
        copy.buyNumber = self.buyNumber;
        copy.doctorId = [self.doctorId copyWithZone:zone];
        copy.goodsPrice = [self.goodsPrice copyWithZone:zone];
        copy.createDate = [self.createDate copyWithZone:zone];
        copy.orderType = self.orderType;
        copy.goodsMmoney = [self.goodsMmoney copyWithZone:zone];
    }
    
    return copy;
}



@end
