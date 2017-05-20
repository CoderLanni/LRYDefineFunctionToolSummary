//
//  ViewController.m
//  个人中心的 headView 拉伸&导航隐藏出现
//
//  Created by ZE KANG on 2017/5/15.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "NavHeadTitleView.h"
#import "HeadImageView.h"
//#import "HeadLineView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
//颜色
#define JXColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface ViewController ()<NavHeadTitleViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    //头像
    UIImageView *_headerImg;
    //昵称
    UILabel *_nickLabel;
//    NSMutableArray *_dataArray0;
//    NSMutableArray *_dataArray1;
//    NSMutableArray *_dataArray2;
    
    
}

@property(nonatomic,strong)UIImageView *backgroundImgV;//背景图
@property(nonatomic,assign)float backImgHeight;
@property(nonatomic,assign)float backImgWidth;
@property(nonatomic,assign)float backImgOrgy;
@property(nonatomic,strong)NavHeadTitleView *NavView;//导航栏
@property(nonatomic,strong)HeadImageView *headImageView;//头视图
//@property(nonatomic,strong)HeadLineView *headLineView;//
//@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,assign)int rowHeight;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //拉伸顶部图片
    [self lashenBgView];
    //创建导航栏
    [self createNav];
    //创建TableView
    [self createTableView];

    
}
//创建TableView
-(void)createTableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
//        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_tableView];
    }
    [_tableView setTableHeaderView:[self headImageView]];
}

//拉伸顶部图片
-(void)lashenBgView{
    UIImage *image=[UIImage imageNamed:@"bg-mine"];
    //图片的宽度设为屏幕的宽度，高度自适应
    NSLog(@"%f",image.size.height);
    _backgroundImgV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, image.size.height*0.6)];
    _backgroundImgV.image=image;
    _backgroundImgV.userInteractionEnabled=YES;
    [self.view addSubview:_backgroundImgV];
    _backImgHeight=_backgroundImgV.frame.size.height;
    _backImgWidth=_backgroundImgV.frame.size.width;
    _backImgOrgy=_backgroundImgV.frame.origin.y;
}
//头视图
-(HeadImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[HeadImageView alloc]init];
        _headImageView.frame=CGRectMake(0, 64, WIDTH, 170);
        _headImageView.backgroundColor=[UIColor clearColor];
        
        //_headImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"个人页背景图.png"]];
        
        _headerImg=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-35, 50, 70, 70)];
        _headerImg.center=CGPointMake(WIDTH/2, 70);
        [_headerImg setImage:[UIImage imageNamed:@"zrx7.jpg"]];
        [_headerImg.layer setMasksToBounds:YES];
        [_headerImg.layer setCornerRadius:35];
        _headerImg.backgroundColor=[UIColor whiteColor];
        _headerImg.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [_headerImg addGestureRecognizer:tap];
        [_headImageView addSubview:_headerImg];
        //昵称
        _nickLabel=[[UILabel alloc]initWithFrame:CGRectMake(147, 130, 105, 20)];
        _nickLabel.center=CGPointMake(WIDTH/2, 125);
        _nickLabel.text=@"执念12o3";
        //        _nickLabel.font=JXFont(14);
        _nickLabel.textColor=[UIColor whiteColor];
        _nickLabel.textAlignment=NSTextAlignmentCenter;
        UIButton *fixBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        fixBtn.frame=CGRectMake(CGRectGetMaxX(_nickLabel.frame)+5, 114, 22, 22);
        [fixBtn setImage:[UIImage imageNamed:@"pencil-light-shadow"] forState:UIControlStateNormal];
        [fixBtn addTarget:self action:@selector(fixClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headImageView addSubview:fixBtn];
        [_headImageView addSubview:_nickLabel];
    }
    return _headImageView;
}
//头像点击事件
-(void)tapClick:(UITapGestureRecognizer *)recognizer{
    NSLog(@"你打到我的头了");
}
//修改昵称
-(void)fixClick:(UIButton *)btn{
    NSLog(@"修改昵称");
}
-(void)createNav{
    self.NavView=[[NavHeadTitleView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    self.NavView.title=@"个人中心";
    self.NavView.color=[UIColor whiteColor];
    self.NavView.backTitleImage=@"Mail";
    self.NavView.rightTitleImage=@"Setting";
    self.NavView.delegate=self;
    [self.view addSubview:self.NavView];
}
//左按钮
-(void)NavHeadback{
    NSLog(@"点击了左按钮");
}
//右按钮回调
-(void)NavHeadToRight{
    NSLog(@"点击了右按钮");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int contentOffsety = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y<=170) {
        self.NavView.headBgView.alpha=scrollView.contentOffset.y/170;
        self.NavView.backTitleImage=@"Mail";
        self.NavView.rightImageView=@"Setting";
        self.NavView.color=[UIColor whiteColor];
        //状态栏字体白色
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    }else{
        self.NavView.headBgView.alpha=1;
        //self.NavView.title
        self.NavView.backTitleImage=@"Mail-click";
        self.NavView.rightImageView=@"Setting-click";
        self.NavView.color=JXColor(87, 173, 104, 1);
        //隐藏黑线
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        //状态栏字体黑色
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
    }
    if (contentOffsety<0) {
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight-contentOffsety;
        rect.size.width = _backImgWidth* (_backImgHeight-contentOffsety)/_backImgHeight;
        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
        rect.origin.y = 0;
        _backgroundImgV.frame = rect;
    }else{
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight;
        rect.size.width = _backImgWidth;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _backgroundImgV.frame = rect;
        
    }
    
}

#pragma mark ---- UITableViewDelegate ----
//section高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 48;
//}
//cellRow 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
// cell 数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 10;
}
//sectionView
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (!_headLineView) {
//        _headLineView=[[HeadLineView alloc]init];
//        _headLineView.frame=CGRectMake(0, 0, WIDTH, 48);
//        _headLineView.delegate=self;
//        [_headLineView setTitleArray:@[@"日鉴",@"阅读",@"物品"]];
//    }
//    //如果headLineView需要添加图片，请到HeadLineView.m中去设置就可以了，里面有注释
//    
//    return _headLineView;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]init];

//    //创建一个静态标识符  来给每一个cell 加上标记  方便我们从复用队列里面取到 名字为该标记的cell
//    static NSString *reusID=@"ID";
//    //我创建一个cell 先从复用队列dequeue 里面 用上面创建的静态标识符来取
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reusID];
//    //做一个if判断  如果没有cell  我们就创建一个新的 并且 还要给这个cell 加上复用标识符
//    if (!cell) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reusID];
//    }
//    if (_currentIndex==0) {
//        cell.textLabel.text=[_dataArray0 objectAtIndex:indexPath.row];
//        
//        cell.detailTextLabel.text=[_dataArray0 objectAtIndex:indexPath.row];
//        
//        [cell.imageView setImage:[UIImage imageNamed:@"23.jpg"]];
//        return cell;
//        
//    }else if(_currentIndex==1){
//        cell.textLabel.text=[_dataArray1 objectAtIndex:indexPath.row];
//        
//        cell.detailTextLabel.text=[_dataArray1 objectAtIndex:indexPath.row];
//        
//        [cell.imageView setImage:[UIImage imageNamed:@"5.jpg"]];
//        
//        return cell;
//    }else if(_currentIndex==2){
//        cell.textLabel.text=[_dataArray2 objectAtIndex:indexPath.row];
//        
//        cell.detailTextLabel.text=[_dataArray2 objectAtIndex:indexPath.row];
//        
//        [cell.imageView setImage:[UIImage imageNamed:@"29.jpg"]];
//        
//        return cell;
//    }
    cell.backgroundColor =[UIColor redColor];
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    //cell被点击恢复
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (_currentIndex==0) {
//    }else if (_currentIndex==1){
//    }else{
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
