//
//  ViewController.m
//  UILineLableDemo
//
//  Created by myanycam on 2014/2/25.
//  Copyright (c) 2014年 myanycam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testLabel1.lineType = self.testLabel4.lineType = self.testLabel7.lineType = LineTypeUp;
    self.testLabel2.lineType = self.testLabel5.lineType = self.testLabel8.lineType = LineTypeMiddle;
    self.testLabel3.lineType = self.testLabel6.lineType = self.testLabel9.lineType = LineTypeDown;
    self.testLabel1.lineColor = self.testLabel2.lineColor = self.testLabel3.lineColor = [UIColor blueColor];
    self.testLabel4.lineColor = self.testLabel5.lineColor = self.testLabel6.lineColor = [UIColor redColor];
    self.testLabel7.lineColor = self.testLabel8.lineColor = self.testLabel9.lineColor = [UIColor grayColor];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
