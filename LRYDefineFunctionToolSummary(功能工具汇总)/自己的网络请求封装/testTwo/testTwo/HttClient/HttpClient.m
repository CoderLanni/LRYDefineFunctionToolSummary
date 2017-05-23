//
//  HttpClient.m
//  CJHealthy
//
//  Created by Mr.guan on 16/7/9.
//  Copyright © 2016年 Change. All rights reserved.
//

#import "HttpClient.h"
#import "AFNetworking.h"


@interface HttpClient ()
@property (nonatomic,strong)    AFHTTPSessionManager *manager;


@end

@implementation HttpClient



+(HttpClient *)shareInstance
{
    
    static HttpClient* instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        
        
    });
    return instance;
    
}


-(id)init
{

    self = [super init];
    
    if (self) {
        
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
            _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    }
    
    return self;
}


+(void)getWithURL:(NSString *)urlStr parameter:(NSDictionary *)parameter success:(HttpSuccessBlock)success failure:(httpFaileBlock)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setDictionary:parameter];
    
    
//    NSString *pathURL = [NSString stringWithFormat:@"%@%@",kHostURL,urlStr];//全局定义了主机
     NSString *pathURL = [NSString stringWithFormat:@"%@",urlStr];//没有主机地址
    
    
    
    
    
   [[HttpClient shareInstance].manager GET:pathURL parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}




+(void)sendPostWithURL:(NSString *)urlStr parameter:(NSDictionary *)parameter success:(HttpSuccessBlock)success failure:(httpFaileBlock)failure
{
    
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setDictionary:parameter];
    

//    NSString *pathURL = [NSString stringWithFormat:@"%@%@",kHostURL,urlStr];//全局定义了主机
    NSString *pathURL = [NSString stringWithFormat:@"%@",urlStr];//没有主机地址
    
    
    [[HttpClient shareInstance].manager POST:pathURL parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"成功  ---afn--3.0-- %@ ",responseObject);

//        NSError *error = nil;
//        id jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject
//                                                        options:NSJSONReadingAllowFragments
//                                                          error:&error];
//        NSLog(@"--- >>>> %@ ",jsonObject);
//
//        if (jsonObject !=nil && error ==nil) {
//             success(jsonObject);
////        }else {
            success(responseObject);
//        }
        
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败  ----- %@ ",[error description]);
        
        failure(error);
    }];
    
    
}

+(void)cancelRequest{
    
    [[HttpClient shareInstance].manager.tasks  makeObjectsPerformSelector:@selector(cancel)];
    
}

@end
