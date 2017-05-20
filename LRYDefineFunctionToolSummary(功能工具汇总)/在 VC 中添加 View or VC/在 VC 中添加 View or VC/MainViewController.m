//
//  MainViewController.m
//  在 VC 中添加 View or VC
//
//  Created by ZE KANG on 2017/5/11.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewController.h"
#import "AppearView.h"
#import "FirstViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface MainViewController ()
@property (nonatomic, assign) NSInteger state;
@property(nonatomic, strong)AppearView  *bigView;

@end

@implementation MainViewController

//tabelview 要在页面将要出现中加载
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    //添加一个viewCOntroller到当前的controller中
//    
//    MainTableViewController * MTVC = [[MainTableViewController alloc]init];
//    self.automaticallyAdjustsScrollViewInsets = NO; //防止 tabelview 出现不必要的64px 位移,在这个带有 xib 的 VC中
//
//    MTVC.view.backgroundColor = [UIColor lightGrayColor];
//    [self addChildViewController:MTVC];
//    MTVC.view.frame = CGRectMake(50,200,kScreenW-100 ,300);
//    [self.view addSubview:MTVC.view];
//    self.view.clipsToBounds = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.state = 0;
    [self creatViewUI];
    
    
}
- (IBAction)btnClick:(id)sender {
    //添加一个viewCOntroller到当前的controller中
    
    MainTableViewController * MTVC = [[MainTableViewController alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO; //防止 tabelview 出现不必要的64px 位移,在这个带有 xib 的 VC中
    
    MTVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:MTVC];
    MTVC.view.frame = CGRectMake(50,200,kScreenW-100 ,300);
    [self.view addSubview:MTVC.view];
    self.view.clipsToBounds = NO;
 
}

-(void)creatViewUI{
   

        self.bigView = [[AppearView alloc]initWithFrame:CGRectMake(0,200,kScreenW-100 ,300)];
    [self.bigView.btn addTarget:self action:@selector(viewBtnHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.bigView];
    self.bigView.hidden = YES;
    
}
- (IBAction)viewBtnClick:(id)sender {
 
    if (self.state == 0) {
//        bigView.hidden = NO;
        [ self.bigView setHidden:NO];
        self.state =1;
        NSLog(@"==== %ld",(long)self.state);
    }
    else{
//        bigView.hidden = YES;
        [ self.bigView setHidden:YES];

        self.state =0;
        NSLog(@"==== %ld",(long)self.state);

    }
}
-(void)viewBtnHandle{
    NSLog(@"view 的 Btn ");
}


- (IBAction)vcAppearHandle:(id)sender {
    
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    firstVC.view.backgroundColor = [UIColor blueColor];
    
    firstVC.view.frame = CGRectMake(50,200,kScreenW-100 ,300);
    [self addChildViewController:firstVC];
    [self.view addSubview:firstVC.view];
//    self.view.clipsToBounds = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
