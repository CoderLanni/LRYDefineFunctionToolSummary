//
//  ViewController.m
//  倒计时
//
//  Created by 韩俊强 on 16/2/19.
//  Copyright © 2016年 韩俊强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
     dispatch_source_t _timer;
}
@end

@implementation ViewController



/**
 * 倒计时
 *
 * @param endTime 截止的时间戳
 *
 * @return 返回的剩余时间
 */
/*
- (NSString*)remainingTimeMethodAction:(long long)endTime
{
    //得到当前时间
    NSDate *nowData = [NSDate date];
    NSDate *endData=[NSDate dateWithTimeIntervalSince1970:endTime];
    NSCalendar* chineseClendar = [ [ NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar ];
    NSUInteger unitFlags =
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:nowData toDate: endData options:0];
    NSInteger Hour = [cps hour];
    NSInteger Min = [cps minute];
    NSInteger Sec = [cps second];
    NSInteger Day = [cps day];
    NSInteger Mon = [cps month];
    NSInteger Year = [cps year];
    NSLog( @" From Now to %@, diff: Years: %d Months: %d, Days; %d, Hours: %d, Mins:%d, sec:%d",
          [nowData description], Year, Mon, Day, Hour, Min,Sec );
    NSString *countdown = [NSString stringWithFormat:@"还剩: %zi天 %zi小时 %zi分钟 %zi秒 ", Day,Hour, Min, Sec];
    if (Sec<0) {
        countdown=[NSString stringWithFormat:@"活动结束/开始抢购"];
    }
    return countdown;
}

*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1494345600];
    [self downSecondHandle:@"1494622800000"];
    
    //    [self remainingTimeMethodAction:1494349200];
    
}


#pragma mark- 第二种方法

/**
 *  获取当天的年月日的字符串
 *  这里测试用
 *  @return 格式为年-月-日
 */
//-(NSString *)getyyyymmdd{
//    NSDate *now = [NSDate date];
//    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
//    formatDay.dateFormat = @"yyyy-MM-dd";
//    NSString *dayStr = [formatDay stringFromDate:now];
//    
//    return dayStr;
//    
//}

//时间戳转换为日期格式(毫秒的时间戳)
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    NSLog(@"时间 === %@",dateString);
    return dateString;
}
-(void)downSecondHandle:(NSString *)aTimeString{
  
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    

    NSDate *endDate = [dateFormatter dateFromString:[self timeWithTimeIntervalString:aTimeString]]; //结束时间
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate])];
    NSDate *startDate = [NSDate date];
        NSString* dateString = [dateFormatter stringFromDate:startDate];
    NSLog(@"现在的时间 === %@",dateString);
    NSTimeInterval timeInterval =[endDate_tomorrow timeIntervalSinceDate:startDate];
    
    if (_timer==nil) {
        __block int timeout = timeInterval; //倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.dayLabel.text = @"";
                        self.hourLabel.text = @"00";
                        self.minuteLabel.text = @"00";
                        self.secondLabel.text = @"00";
                    });
                }else{
                    int days = (int)(timeout/(3600*24));
                    if (days==0) {
                        self.dayLabel.text = @"";
                    }
                    int hours = (int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (days==0) {
                            self.dayLabel.text = @"0天";
                        }else{
                            self.dayLabel.text = [NSString stringWithFormat:@"%d天",days];
                        }
                        if (hours<10) {
                            self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
                        }else{
                            self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
                        }
                        if (minute<10) {
                            self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
                        }else{
                            self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
                        }
                        if (second<10) {
                            self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
                        }else{
                            self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
                        }
                        
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
        }
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
