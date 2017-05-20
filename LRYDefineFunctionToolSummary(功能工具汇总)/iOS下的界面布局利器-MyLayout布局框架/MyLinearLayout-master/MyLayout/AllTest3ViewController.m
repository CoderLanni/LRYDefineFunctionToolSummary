//
//  Test12ViewController.m
//  MyLayout
//
//  Created by oybq on 15/6/24.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "AllTest3ViewController.h"
#import "MyLayout.h"
#import "CFTool.h"

@interface AllTest3ViewController ()

@property(nonatomic, strong) MyFrameLayout *frameLayout;

@property(nonatomic, strong) MyLinearLayout *popmenuLayout;
@property(nonatomic, strong) MyLinearLayout *popmenuContainerLayout;
@property(nonatomic, strong) UIScrollView *popmenuScrollView;
@property(nonatomic, strong) MyFlowLayout *popmenuItemLayout;


//用来测试隐藏子视图时重新布局一些视图
@property(nonatomic, strong) MyBaseLayout *hideSubviewRelayoutLayout;
@property(nonatomic, strong) UIButton *hiddenTestButton;

//浮动文本的布局
@property(nonatomic,strong) MyBaseLayout *flexedLayout;
@property(nonatomic,strong)  UILabel *leftFlexedLabel;
@property(nonatomic, strong) UILabel *rightFlexedLabel;

//伸缩布局
@property(nonatomic,strong) MyBaseLayout *shrinkLayout;

@end

@implementation AllTest3ViewController



-(void)loadView
{
   
    /*
     在一些应用的关于界面，以及用户个人信息的展示和修改界面我们通常都会用UITableView来实现，这些UITableView的特点是UITableViewCell的数量是固定的
     而且每个UITableViewCell的布局样式可能有很大的不同，而且通常都会有分组的情况。如果我们采用传统的UITableView来实现这些功能，将会有很多的缺陷：
     
     1。你的DataSourceDelegate 的实现如果是不同样式的Cell，每个Cell的逻辑不同，这样选择都会产生一个很大的switch的分支来处理不同的情况，如果有分组则更加复杂
     2。不同的Cell难以实现不同样式的分割线，不同的背景设置。
     3。如果Cell中需要有输入的UITextField时，当改变文本框的值时难以更新其绑定的属性。
     4。因为Cell中有复用机制，所以Cell中的某些子视图的状态也需要单独的进行保存，比如高亮，enable等等。这样将增加程序的复杂性
     5。每个Cell中的内容的高度可能不一样，难以动态计算Cell的高度。
     
     因此综上所述，我们一般不建议这些界面通过UITableView来实现，而是采用UIScrollView加MyLinearLayout来实现，因为布局库本身就支持事件的单击触摸和
     背景的设置以及分割线的设置等功能，下面的例子将采用线性布局实现一个关于的界面。
     
     */
    
    //根视图用框架布局的原因是底部有一个退出登录按钮是固定在底部的，因此这里用框架布局来实现整体布局是最好的方法。一般框架布局都是用来实现视图控制器的根本视图。
    MyFrameLayout *frameLayout = [MyFrameLayout new];
    frameLayout.backgroundColor = [CFTool color:0];
    self.view = frameLayout;
    self.frameLayout = frameLayout;
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.myMargin = 0;  //scrollView的尺寸和frameLayout的尺寸一致。
    scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:scrollView];
    
    UIButton *button = [UIButton new];
    [button setTitle:NSLocalizedString(@"Logout", @"") forState:UIControlStateNormal];
    button.backgroundColor = [CFTool color:3];
    button.titleLabel.font = [CFTool font:16];
    button.tintColor = [CFTool color:0];
    button.myHeight = 50;
    button.myHorzMargin = 0;
    button.myBottom = 0;
    [self.view addSubview:button];

    //整体一个线性布局，实现各种片段。
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;
    contentLayout.gravity = MyGravity_Horz_Fill;  //子视图里面的内容的宽度跟布局视图相等，这样子视图就不需要设置宽度了。
    contentLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [scrollView addSubview:contentLayout];
    
    //头部布局。
    [self addHeaderLayout:contentLayout];

    
    //添加，弹出菜单的布局
    [self addPopmenuLayout:contentLayout];
    
    
     //添加事件处理，以及高亮背景，边界线的布局
    [self addHighlightedBackgroundAndBorderLineLayout:contentLayout];
    
    
    //添加，左右浮动间距，以及宽度最大限制的布局
    [self addFlexedWidthLayout:contentLayout];
    
    //添加，隐藏重新布局的布局。
    [self addHideSubviewReLayoutLayout:contentLayout];
   
    //添加，自动伸缩布局
    [self addShrinkLayout:contentLayout];
    

    //测试布局位置和布局尺寸的active属性。
    [self addActiveLayout:contentLayout];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Layout Construction

//添加头部布局。里面用的相对布局实现。
-(void)addHeaderLayout:(MyLinearLayout *)contentLayout
{
    MyRelativeLayout *headerLayout = [MyRelativeLayout new];
    headerLayout.backgroundImage = [UIImage imageNamed:@"bk1"];  //可以为布局直接设备背景图片。
    headerLayout.wrapContentHeight = YES;
    [contentLayout addSubview:headerLayout];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head2"]];
    headerImageView.layer.cornerRadius = headerImageView.estimatedRect.size.height / 2; //
    headerImageView.backgroundColor = [UIColor whiteColor];
    headerImageView.centerXPos.equalTo(@0);
    headerImageView.centerYPos.equalTo(@0);  //在父视图中居中。
    [headerLayout addSubview:headerImageView];
    
    UILabel *headerNameLabel = [UILabel new];
    headerNameLabel.text = @"欧阳大哥";
    headerNameLabel.font = [CFTool font:17];
    headerNameLabel.textColor = [CFTool color:4];
    [headerNameLabel sizeToFit];
    headerNameLabel.centerXPos.equalTo(@0);
    headerNameLabel.topPos.equalTo(headerImageView.bottomPos).offset(10);
    [headerLayout addSubview:headerNameLabel];
    
    
    //将useFrame属性设置为YES后。即使是布局里面的子视图也不会参与自动布局，而是可以通过最原始的设置frame的值来进行位置定位和尺寸的确定。
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    imageView2.backgroundColor = [UIColor whiteColor];
    imageView2.frame = CGRectMake(5, 5, 30, 30);
    imageView2.useFrame = YES;   //设置了这个属性后，这个子视图将不会被布局控制，而是直接用frame设置的为准。
    [contentLayout addSubview:imageView2];
    
}

//添加高亮，以及边界线效果的布局
-(void)addHighlightedBackgroundAndBorderLineLayout:(MyLinearLayout *)contentLayout
{
    //如果您只想要高亮效果而不想处理事件则方法：setTarget中的action为nil即可。
    
    //具有事件处理的layout,以及边界线效果的layout
    MyLinearLayout *layout1 = [self createActionLayout:NSLocalizedString(@"please touch here(no highlighted)", @"") action:@selector(handleTap:)];
    layout1.myTop = 10;
    layout1.topBorderline = [[MyBorderline alloc] initWithColor:[UIColor yellowColor]];
    layout1.topBorderline.headIndent = -10;
    layout1.topBorderline.tailIndent = -10; //底部边界线如果为负数则外部缩进
    layout1.bottomBorderline = [[MyBorderline alloc] initWithColor:[UIColor redColor]];  //设置底部和顶部都有红色的线
    [contentLayout addSubview:layout1];
    
    //具有事件处理的layout,高亮背景色的设置。
    MyLinearLayout *layout2 = [self createActionLayout:NSLocalizedString(@"please touch here(highlighted background)", @"") action:@selector(handleTap:)];
    layout2.highlightedBackgroundColor = [CFTool color:5]; //可以设置高亮的背景色用于单击事件
    layout2.bottomBorderline = [[MyBorderline alloc] initWithColor:[CFTool color:3]];
    layout2.bottomBorderline.thick = 4; //设置底部有红色的线，并且粗细为4
    //您还可以为布局视图设置按下、按下取消的事件处理逻辑。
    [layout2 setTouchDownTarget:self action:@selector(handleTouchDown:)];
    [layout2 setTouchCancelTarget:self action:@selector(handleTouchCancel:)];
    [contentLayout addSubview:layout2];
    
    //具有事件处理的layout, 可以设置触摸时的高亮背景图。虚线边界线。
    MyLinearLayout *layout3 = [self createActionLayout:NSLocalizedString(@"please touch here(highlighted background image)", @"") action:@selector(handleTap:)];
    layout3.highlightedBackgroundImage = [UIImage imageNamed:@"image2"]; //设置单击时的高亮背景图片。
    MyBorderline *dashLine = [[MyBorderline alloc] initWithColor:[UIColor greenColor]];
    dashLine.dash = 3;    //设置为非0表示虚线边界线。
    layout3.leadingBorderline = dashLine; //设置左右边绿色的虚线
    layout3.trailingBorderline = dashLine;
    [contentLayout addSubview:layout3];
    
}

-(void)addPopmenuLayout:(MyLinearLayout *)contentLayout
{
    MyLinearLayout *layout = [self createActionLayout:NSLocalizedString(@"please touch here(will pop menu)", @"") action:@selector(handleShowPopMenu:)];
    layout.highlightedOpacity = 0.2;  //按下时的高亮透明度。为1全部透明。
    layout.myTop = 10;
    [contentLayout addSubview:layout];
}

//添加隐藏重新布局的布局
-(void)addHideSubviewReLayoutLayout:(MyLinearLayout *)contentLayout
{
    //下面两个布局用来测试布局视图的hideSubviewReLayout属性。
    MyLinearLayout *switchLayout = [self createSwitchLayout:NSLocalizedString(@"relayout switch when subview hidden&show", @"") action:@selector(handleReLayoutSwitch:)];
    switchLayout.bottomBorderline = [[MyBorderline alloc] initWithColor:[UIColor redColor]]; //底部边界线设置可以缩进
    switchLayout.bottomBorderline.headIndent = 10;
    switchLayout.bottomBorderline.tailIndent = 10;
    switchLayout.myTop = 10;
    [contentLayout addSubview:switchLayout];


    MyLinearLayout *testLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    testLayout.backgroundColor = [UIColor whiteColor];
    testLayout.leftPadding = 10;
    testLayout.rightPadding = 10;
    testLayout.myHeight = 50;
    testLayout.gravity = MyGravity_Vert_Fill;
    testLayout.subviewHSpace = 10;
    [contentLayout addSubview:testLayout];
    self.hideSubviewRelayoutLayout = testLayout;
    
    UIButton *leftButton = [UIButton new];
    leftButton.myWidth = 50;
    leftButton.backgroundColor = [CFTool color:5];
    [testLayout addSubview:leftButton];
    
    UIButton *centerButton = [UIButton new];
    [centerButton setTitle:NSLocalizedString(@"touch hide me", @"") forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(handleHideSelf:) forControlEvents:UIControlEventTouchUpInside];
    centerButton.backgroundColor = [CFTool color:6];
    centerButton.titleLabel.font = [CFTool font:14];
    [centerButton sizeToFit];
    centerButton.weight = 1; //均分剩余的宽度。
    [testLayout addSubview:centerButton];
    self.hiddenTestButton = centerButton;
    
    UIButton *rightButton = [UIButton new];
    [rightButton setTitle:NSLocalizedString(@"touch show me", @"") forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(handleShowBrother:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.backgroundColor = [CFTool color:7];
    rightButton.titleLabel.font = [CFTool font:14];
    [rightButton sizeToFit];
    rightButton.weight = 1; //均分剩余的宽度。
    [testLayout addSubview:rightButton];
    
}

//添加，一个浮动宽度的布局，里面的子视图的宽度是浮动的，会进行宽度的合适的分配。您可以尝试着点击加减按钮测试结果。
-(void)addFlexedWidthLayout:(MyLinearLayout*)contentLayout
{
    MyBaseLayout *operatorLayout = [self createSegmentedLayout:@selector(handleLeftFlexed:) rightAction:@selector(handleRightFlexed:)];
    operatorLayout.bottomBorderline = [[MyBorderline alloc] initWithColor:[UIColor redColor]]; //底部边界线设置可以缩进
    operatorLayout.bottomBorderline.headIndent = 10;
    operatorLayout.bottomBorderline.tailIndent = 10;
    operatorLayout.myTop = 10;
    [contentLayout addSubview:operatorLayout];
    
    MyLinearLayout *testLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    testLayout.backgroundColor = [UIColor whiteColor];
    testLayout.leftPadding = 10;
    testLayout.rightPadding = 10;
    testLayout.myHeight = 50;
    testLayout.gravity = MyGravity_Vert_Fill;
    testLayout.shrinkType = MySubviewsShrink_Auto;  //左右2个子视图会根据自身的宽度自动调整。不会产生覆盖和重叠。
    testLayout.subviewHSpace = 10;
    [contentLayout addSubview:testLayout];
    self.flexedLayout = testLayout;
    
    
    UILabel *leftLabel = [UILabel new];
    leftLabel.text = @"abc";
    leftLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    leftLabel.textColor = [UIColor whiteColor];
    leftLabel.backgroundColor = [CFTool color:5];
    leftLabel.font = [CFTool font:14];
    leftLabel.trailingPos.equalTo(@0.5).min(0); //右边浮动间距为0.5,最小为0
    leftLabel.wrapContentWidth = YES;  //宽度由内容包裹
    [testLayout addSubview:leftLabel];
    self.leftFlexedLabel = leftLabel;
    
    UILabel *rightLabel = [UILabel new];
    rightLabel.text = @"123";
    rightLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.backgroundColor = [CFTool color:6];
    rightLabel.font = [CFTool font:14];
    rightLabel.leadingPos.equalTo(@0.5).min(0);   //左边浮动间距为0.5，最小为0
    rightLabel.wrapContentWidth = YES; //宽度由内容包裹
    [testLayout addSubview:rightLabel];
    self.rightFlexedLabel = rightLabel;
    
    
}

//添加一个能伸缩的布局
-(void)addShrinkLayout:(MyLinearLayout*)contentLayout
{
    //下面两个布局用来测试布局视图的hideSubviewReLayout属性。
    MyLinearLayout *switchLayout = [self createSwitchLayout:NSLocalizedString(@"show all switch", @"") action:@selector(handleShrinkSwitch:)];
    switchLayout.bottomBorderline = [[MyBorderline alloc] initWithColor:[UIColor redColor]]; //底部边界线设置可以缩进
    switchLayout.bottomBorderline.headIndent = 10;
    switchLayout.bottomBorderline.tailIndent = 10;
    switchLayout.myTop = 10;
    [contentLayout addSubview:switchLayout];
    
    MyFlowLayout *testLayout = [MyFlowLayout flowLayoutWithOrientation:MyOrientation_Vert arrangedCount:3];
    testLayout.backgroundColor = [UIColor whiteColor];
    testLayout.gravity = MyGravity_Horz_Fill;  //尺寸相等
    testLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    testLayout.subviewHSpace = 10;
    testLayout.subviewVSpace = 10;
    testLayout.heightSize.equalTo(@50);
    testLayout.clipsToBounds = YES;
    [contentLayout addSubview:testLayout];
    self.shrinkLayout = testLayout;
    
    for (int i = 0 ; i < 10; i++)
    {
        UILabel *label = [UILabel new];
        label.backgroundColor = [CFTool color:i + 1];
        label.font = [CFTool font:14];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.textAlignment = NSTextAlignmentCenter;
        [label sizeToFit];
        [testLayout addSubview:label];
    }

    
}

//这个例子用来描述布局位置和布局尺寸对象的active属性的使用。
-(void)addActiveLayout:(MyLinearLayout*)contentLayout
{
    /*
       这个例子提供了1.3.1版本中MyLayoutSize和MyLayoutPos类新加入的属性active属性的使用方法。默认情况下这个属性的值都是YES表示指定的位置或者尺寸的设置是有效的，如果设置为NO则这个位置或者这个尺寸的设置将无效，不会对布局产生影响。因此你可以通过为位置对象或者尺寸对象设置是否为active来在运行中进行界面布局的动态调整。
     */
    MyLinearLayout *testLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    testLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    testLayout.backgroundColor = [UIColor whiteColor];
    testLayout.myTop = 10;
    testLayout.myBottom = 50;   //这里设置底部间距的原因是登录按钮在最底部。为了使得滚动到底部时不被覆盖。你也可以设置contentLayout的bottomPadding = 50来解决这个问题。
    [contentLayout addSubview:testLayout];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [testButton setTitle:@"Click me" forState:UIControlStateNormal];
    testButton.backgroundColor = [CFTool color:0];
    testButton.heightSize.equalTo(@50);
    testButton.widthSize.equalTo(testButton.widthSize).add(20);
    testButton.leadingPos.equalTo(@10).active = YES;  //左边边距是10，设置active为YES表示左边位置对象的设置是生效的。
    testButton.trailingPos.equalTo(@10).active = NO;  //右边边距是10，设置active为NO表示右边位置对象的设置是不生效的。
    
    [testButton addTarget:self action:@selector(handleActiveTest:) forControlEvents:UIControlEventTouchUpInside];

    [testLayout addSubview:testButton];
    
}

//创建可执动作事件的布局
-(MyLinearLayout*)createActionLayout:(NSString*)title action:(SEL)action
{
    MyLinearLayout *actionLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    actionLayout.backgroundColor = [UIColor whiteColor];
    [actionLayout setTarget:self action:action];    //这里设置布局的触摸事件处理。
    
    //左右内边距都是10，不包裹子视图，整体高度为50，里面的子布局垂直居中对齐。
    actionLayout.leftPadding = 10;
    actionLayout.rightPadding = 10;
    actionLayout.wrapContentWidth = NO;
    actionLayout.heightSize.equalTo(@50);
    actionLayout.gravity = MyGravity_Vert_Center;
    
    
    UILabel *label = [UILabel new];
    label.text = title;
    label.font = [CFTool font:14];
    label.textColor = [CFTool color:4];
    label.adjustsFontSizeToFitWidth = YES;
    [label sizeToFit];
    label.tag = 1000;
    label.trailingPos.equalTo(@0.5);  //水平线性布局通过相对间距来实现左右分开排列。
    [actionLayout addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next"]];
    [imageView sizeToFit];
    imageView.leadingPos.equalTo(@0.5);
    [actionLayout addSubview:imageView];
    
    return actionLayout;
    
}

//创建具有开关的布局
-(MyLinearLayout*)createSwitchLayout:(NSString*)title action:(SEL)action
{
    MyLinearLayout *switchLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    switchLayout.backgroundColor = [UIColor whiteColor];
    
    //左右边距都是10，不包裹子视图，整体高度为50，里面的子布局垂直居中对齐。
    switchLayout.leftPadding = 10;
    switchLayout.rightPadding = 10;
    switchLayout.wrapContentWidth = NO;
    switchLayout.heightSize.equalTo(@50);
    switchLayout.gravity = MyGravity_Vert_Center;
    
    
    UILabel *label = [UILabel new];
    label.text = title;
    label.font = [CFTool font:14];
    label.textColor = [CFTool color:4];
    label.adjustsFontSizeToFitWidth = YES;
    [label sizeToFit];
    label.weight = 1;
    [switchLayout addSubview:label];
    
    
    
    UISwitch *switchCtrl = [UISwitch new];
    [switchCtrl addTarget:self action:action forControlEvents:UIControlEventValueChanged];
    switchCtrl.trailingPos.min(5);
    [switchLayout addSubview:switchCtrl];
    
    return switchLayout;
}

-(MyFloatLayout*)createSegmentedLayout:(SEL)leftAction rightAction:(SEL)rightAction
{
    //建立一个左右浮动布局(注意左右浮动布局的orientation是MyOrientation_Vert)
    MyFloatLayout *segmentedLayout = [MyFloatLayout floatLayoutWithOrientation:MyOrientation_Vert];
    segmentedLayout.backgroundColor = [UIColor whiteColor];
    
    //左右边距都是10，不包裹子视图，整体高度为50，里面的子布局垂直居中对齐。
    segmentedLayout.leftPadding = 10;
    segmentedLayout.rightPadding = 10;
    segmentedLayout.heightSize.equalTo(@50);
    segmentedLayout.gravity = MyGravity_Vert_Center;
    
    //向左浮动
    UISegmentedControl *leftSegmented = [[UISegmentedControl alloc] initWithItems:@[@"  -  ",@"  +  "]];
    leftSegmented.tintColor = [CFTool color:7];
    leftSegmented.momentary = YES;
    [leftSegmented addTarget:self action:leftAction forControlEvents:UIControlEventValueChanged];
    [segmentedLayout addSubview:leftSegmented];
    
    
    UISegmentedControl *rightSegmented = [[UISegmentedControl alloc] initWithItems:@[@"  +  ",@"  -  "]];
    rightSegmented.tintColor = [CFTool color:7];
    rightSegmented.momentary = YES;
    [rightSegmented addTarget:self action:rightAction forControlEvents:UIControlEventValueChanged];
    [segmentedLayout addSubview:rightSegmented];
    rightSegmented.reverseFloat = YES;  //反向浮动也就是向右浮动。

    
    return segmentedLayout;

}



#pragma mark -- Handle Method

-(void)handleTap:(MyBaseLayout*)sender
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"test" message:@"you touched this section" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [av show];
}

-(void)handleTouchDown:(MyBaseLayout*)sender
{
    UILabel *label = (UILabel*)[sender viewWithTag:1000];
    label.textColor = [UIColor blueColor];
    
    NSLog(@"按下动作");
}

-(void)handleTouchCancel:(MyBaseLayout*)sender
{
    UILabel *label = (UILabel*)[sender viewWithTag:1000];
    label.textColor = [UIColor blackColor];
    NSLog(@"按下取消");
}

-(void)handleReLayoutSwitch:(MyBaseLayout *)sender
{
    self.hideSubviewRelayoutLayout.hideSubviewReLayout = !self.hideSubviewRelayoutLayout.hideSubviewReLayout;
}

-(void)handleHideSelf:(UIButton*)sender
{
    self.hiddenTestButton.hidden = YES;
}

-(void)handleShowBrother:(UIButton*)sender
{
    self.hiddenTestButton.hidden = NO;
}

-(void)handleLeftFlexed:(UISegmentedControl*)segmented
{
 
    if (segmented.selectedSegmentIndex == 0)
    {
        if (self.leftFlexedLabel.text.length > 1)
        {
            self.leftFlexedLabel.text = [self.leftFlexedLabel.text stringByReplacingCharactersInRange:NSMakeRange(self.leftFlexedLabel.text.length - 1, 1) withString:@""];

        }
    }
    else
    {
        NSString *strs = @"abcdefghijklmnopqrstuvwxyz";
        self.leftFlexedLabel.text = [self.leftFlexedLabel.text stringByAppendingString:[strs substringWithRange:NSMakeRange(arc4random_uniform((uint32_t)strs.length), 1)]];
    }
    
}

-(void)handleRightFlexed:(UISegmentedControl*)segmented
{
    if (segmented.selectedSegmentIndex == 0)
    {
        NSString *strs = @"01234567890";
        self.rightFlexedLabel.text = [self.rightFlexedLabel.text stringByAppendingString:[strs substringWithRange:NSMakeRange(arc4random_uniform((uint32_t)strs.length), 1)]];
    }
    else
    {
        if (self.rightFlexedLabel.text.length > 1)
        {
            self.rightFlexedLabel.text = [self.rightFlexedLabel.text stringByReplacingCharactersInRange:NSMakeRange(self.rightFlexedLabel.text.length - 1, 1) withString:@""];
            
        }
    }
    
}

-(void)handleShrinkSwitch:(UISwitch *)sender
{
    if (sender.isOn)
    {
        self.shrinkLayout.heightSize.equalTo(nil);
        self.shrinkLayout.wrapContentHeight = YES;
    }
    else
    {
        self.shrinkLayout.heightSize.equalTo(@50);
        self.shrinkLayout.wrapContentHeight = NO;
    }
    
    [self.shrinkLayout layoutAnimationWithDuration:0.3];
}

-(void)handleShowPopMenu:(MyBaseLayout*)sender
{
    if (self.popmenuLayout.superview != nil)
        return;
    
   CGRect rc = [sender convertRect:sender.bounds toView:self.frameLayout]; // 计算应该弹出的位置。要转化为框架布局的rect
    
    MyLinearLayout *menuLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    menuLayout.myWidth = CGRectGetWidth(rc) - 20;  //宽度是sender的宽度减20
    menuLayout.myCenterX = 0;  //因为我们是把弹出菜单展示在self.view下，这时候self.view是一个框架布局。所以这里这是水平居中。
    menuLayout.myTop = CGRectGetMaxY(rc) + 5;  //弹出菜单的顶部位置。

    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"uptip"]];
    arrowImageView.myCenterX = 0;
    [menuLayout addSubview:arrowImageView];
    
    
    MyLinearLayout *containerLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    containerLayout.backgroundColor = [UIColor colorWithRed:0xBF/255.0f green:0xBD/255.0 blue:0xBF/255.0 alpha:1];
    containerLayout.layer.cornerRadius = 4;
    containerLayout.layer.shadowRadius = 5;
    containerLayout.layer.shadowOffset = CGSizeZero;
    containerLayout.layer.shadowOpacity = 0.5;
    containerLayout.layer.shadowColor = [CFTool color:4].CGColor;
    containerLayout.myHorzMargin = 0;
    containerLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    containerLayout.gravity = MyGravity_Horz_Fill;
    [menuLayout addSubview:containerLayout];
    self.popmenuContainerLayout = containerLayout;
    
    UIScrollView *scrollView = [UIScrollView new];
    [containerLayout addSubview:scrollView];
    self.popmenuScrollView = scrollView;
    
    MyFlowLayout *itemLayout = [MyFlowLayout flowLayoutWithOrientation:MyOrientation_Vert arrangedCount:3];
    itemLayout.myHorzMargin = 0;
    itemLayout.gravity = MyGravity_Horz_Fill;
    itemLayout.subviewHSpace = 10;
    itemLayout.subviewVSpace = 10;
    itemLayout.wrapContentHeight = YES;
    [scrollView addSubview:itemLayout];
    self.popmenuItemLayout = itemLayout;
    
    for (int i = 0 ; i < 6; i++)
    {
        UIButton *button = [UIButton new];
        if (i == 5)  //最后一个特殊处理！！！用于添加按钮。
        {
            [button setTitle:NSLocalizedString(@"add item", @"") forState:UIControlStateNormal];
            [button addTarget:self action:@selector(handleAddMe:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [CFTool color:3];
            button.layer.cornerRadius = 5;
            button.titleLabel.font = [CFTool font:14];
        }
        else
        {
            [button setTitle:[NSString stringWithFormat:NSLocalizedString(@"double tap remove:%d", @""),i] forState:UIControlStateNormal];
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            [button addTarget:self action:@selector(handleDelMe:) forControlEvents:UIControlEventTouchDownRepeat];
            button.backgroundColor = [CFTool color:2];
            button.layer.cornerRadius = 5;
            button.titleLabel.font = [CFTool font:14];
            
        }
        [button sizeToFit];
        [itemLayout addSubview:button];
    }
    
    //评估出itemLayout的尺寸，注意这里要明确指定itemLayout的宽度，因为弹出菜单的宽度是sender的宽度-20，而itemLayout的父容器又有20的左右内边距，因此这里要减去40.
    CGRect sz = [itemLayout estimateLayoutRect:CGSizeMake(CGRectGetWidth(rc) - 40, 0)];
    scrollView.heightSize.equalTo(@(sz.size.height)).min(50).max(155);  //设置scrollView的高度，以及最大最小高度。正是这个实现了拉伸限制功能。
    
    UIButton *closeButton = [UIButton new];
    closeButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    closeButton.layer.borderWidth = 0.5;
    closeButton.layer.cornerRadius = 5;
    [closeButton setTitle:NSLocalizedString(@"close pop menu", @"") forState:UIControlStateNormal];
    [closeButton setTitleColor:[CFTool color:4] forState:UIControlStateNormal];
    closeButton.titleLabel.font = [CFTool font:14];
    closeButton.backgroundColor = [UIColor whiteColor];
    [closeButton addTarget:self action:@selector(handleClosePopmenu:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.myTop = 5;
    [closeButton sizeToFit];
    [containerLayout addSubview:closeButton];
    
    UILabel *tipLabel = [UILabel new];
    tipLabel.text = NSLocalizedString(@"you can add and remove item to shrink the pop menu.", @"");
    tipLabel.textColor = [CFTool color:3];
    tipLabel.font = [CFTool font:14];
    tipLabel.adjustsFontSizeToFitWidth = YES;
    [tipLabel sizeToFit];
    [containerLayout addSubview:tipLabel];

    
    //注意这里的self.view是框架布局实现的。
    [self.frameLayout addSubview:menuLayout];
    //为实现动画效果定义初始位置和尺寸。
    menuLayout.frame = CGRectMake(10, self.frameLayout.bounds.size.height, CGRectGetWidth(rc) - 20, 0);
    self.popmenuLayout = menuLayout;
    [self.frameLayout layoutAnimationWithDuration:0.3];
    
    
}

-(void)handleAddMe:(UIButton*)sender
{
    UIButton *button = [UIButton new];
    [button setTitle:[NSString stringWithFormat:NSLocalizedString(@"double tap remove:%d", @""), sender.superview.subviews.count ] forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.backgroundColor = [CFTool color:2];
    button.layer.cornerRadius = 5;
    button.titleLabel.font = [CFTool font:14];
    [button addTarget:self action:@selector(handleDelMe:) forControlEvents:UIControlEventTouchDownRepeat];
    [button sizeToFit];
    [self.popmenuItemLayout insertSubview:button belowSubview:sender];
    
    //重新评估popmenuItemLayout的高度，这里宽度是0的原因是因为宽度已经明确了，也就是在现有的宽度下评估。而前面是因为popmenuItemLayout的宽度还没有明确所以要指定宽度。
    CGRect sz = [self.popmenuItemLayout estimateLayoutRect:CGSizeMake(0, 0)];
    self.popmenuScrollView.heightSize.equalTo(@(sz.size.height));
    
    //多个布局同时动画。
    [self.popmenuItemLayout layoutAnimationWithDuration:0.3];
    [self.popmenuLayout layoutAnimationWithDuration:0.3];
    [self.popmenuContainerLayout layoutAnimationWithDuration:0.3];
    
}

-(void)handleDelMe:(UIButton*)sender
{
    [sender removeFromSuperview];
    CGRect sz = [self.popmenuItemLayout estimateLayoutRect:CGSizeMake(0, 0)];
    self.popmenuScrollView.heightSize.equalTo(@(sz.size.height));

    [self.popmenuItemLayout layoutAnimationWithDuration:0.3];
    [self.popmenuLayout layoutAnimationWithDuration:0.3];
    [self.popmenuContainerLayout layoutAnimationWithDuration:0.3];
}

-(void)handleClosePopmenu:(UIButton*)sender
{
    //因为popmenuLayout的设置会激发frameLayout的重新布局，所以这里用这个方法进行动画消失处理。
    self.popmenuLayout.myTop = self.frameLayout.frame.size.height;

    [UIView animateWithDuration:0.3 animations:^{
        
        [self.frameLayout layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [self.popmenuLayout removeFromSuperview];
        
    }];
   

}

-(void)handleActiveTest:(UIButton*)sender
{
    //下面代码中布局位置的active属性设置的变化所产生的效果。
    if (sender.leadingPos.isActive && sender.trailingPos.isActive)
    {
        sender.leadingPos.active = YES;
        sender.trailingPos.active = NO;  //按钮将停靠在父布局的左边。
    }
    else if (sender.leadingPos.isActive)
    {
        sender.leadingPos.active = NO;
        sender.trailingPos.active = YES;  //按钮将停靠在父布局的右边
    }
    else if (sender.trailingPos.isActive)
    {
        sender.leadingPos.active = YES;
        sender.trailingPos.active = YES;  //按钮的左右边距都生效，并且会拉伸按钮的宽度。
    }
    
    MyLinearLayout *superLayout = (MyLinearLayout*)sender.superview;
    [superLayout layoutAnimationWithDuration:0.3];
    
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
