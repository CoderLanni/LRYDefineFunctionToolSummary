//
//  ViewController.m
//  testTwo
//
//  Created by ZE KANG on 2017/5/23.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "HttpClient.h"
#import<CommonCrypto/CommonDigest.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self request];
}
-(void)request{
    //物流商品信息
    NSDictionary *dictmy = @{@"com":@"baishiwuliu", @"num":@"70361430135387",@"from":@"广东廉江",@"to":@"广东广州"};
    //NSDictionary转换为Data
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dictmy options:NSJSONWritingPrettyPrinted error:nil];
    //Data转换为JSON
    NSString* jsonstr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData string[\n%@\n]", jsonstr);
    
    //签名: MD5(大32位)加密
    NSString *signStr = [self md5:[NSString stringWithFormat:@"%@TdgnWHuo3044888E5937A5F0B18CD8EE3B838F331B2C",jsonstr]];
    NSLog(@"签名 === %@",signStr);
    
    NSDictionary * param = @{@"param":jsonstr,@"sign":signStr,@"customer":@"888E5937A5F0B18CD8EE3B838F331B2C"};
    NSLog(@"请求体 === %@",param);
    
    [HttpClient sendPostWithURL:@"http://poll.kuaidi100.com/poll/query.do" parameter:param success:^(id JSON) {
        NSDictionary *dicttt = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
        NSLog(@"数据 ==== %@",dicttt);
    
    } failure:^(NSError *error) {
          NSLog(@"cuowu ==== %@",error);
    }];
}

// MD5(大32位)加密
-(NSString *)md5:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
