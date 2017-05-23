//
//  HttpClient.h
//  CJHealthy
//
//  Created by Mr.guan on 16/7/9.
//  Copyright © 2016年 Change. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^HttpSuccessBlock)(id JSON) ;
typedef void (^httpFaileBlock)(NSError *error);



@interface HttpClient : NSObject




+(void)getWithURL:(NSString *)urlStr parameter:(NSDictionary *)parameter success:(HttpSuccessBlock)success failure:(httpFaileBlock)failure;

+(void)sendPostWithURL:(NSString *)urlStr parameter:(NSDictionary *)parameter success:(HttpSuccessBlock)success failure:(httpFaileBlock)failure;
+(void)cancelRequest;
@end
