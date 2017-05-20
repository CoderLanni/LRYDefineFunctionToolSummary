//
//  ViewController.h
//  搜索信息
//
//  Created by apple on 16/8/8.
//  Copyright © 2016年 yiqing. All rights reserved.
//

#import "ViewController.h"
#import "ZYTokenManager.h"
#import "muyiViewController.h"
#import "SearchRecordTableViewCell.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

//@property (nonatomic,strong)IBOutlet UITableView * myTableView;
@property (nonatomic,strong)IBOutlet UITextField * searchText;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic,strong)NSMutableArray * searchHistory;
@property (nonatomic,strong)NSArray *myArray;//搜索记录的数组

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [self readNSUserDefaults];
}
-(void)viewDidLoad{
    
    _searchHistory = [NSMutableArray array];
    self.searchText.delegate = self;
    
    //设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    
    [_myTableView registerClass:[SearchRecordTableViewCell class] forCellReuseIdentifier:@"KsearchRecordCellId"];
    //隐藏多余的分割线
   self.myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


-(IBAction)cancelBtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    //    [self.navigationController popViewControllerAnimated:YES];
}

//搜索方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.text.length > 0) {
        //缓存搜索记录
        [ZYTokenManager SearchText:textField.text];
        [self readNSUserDefaults];
        
    }else{
        NSLog(@"请输入查找内容");
    }
    
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
         return 1;
    }else{
        //如果搜索历史长度大于0就隐藏
        if (_myArray.count>0) {
            
            return _myArray.count+1+1;
        }else{
            return 1;
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
         cell.textLabel.text = @"热搜";
        
        return cell;
    }else if (indexPath.section==1) {
        if(indexPath.row ==0){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"历史搜索";
            return cell;
        }else if (indexPath.row == _myArray.count+1){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"清除历史记录";
            cell.textLabel.textColor = [UIColor lightGrayColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        }else{
            SearchRecordTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KsearchRecordCellId"];
            NSArray* reversedArray = [[_myArray reverseObjectEnumerator] allObjects];
            cell.lableText.text = reversedArray[indexPath.row-1];
            cell.lableText.textColor = [UIColor blueColor];
//            if (self.myArray.count != 0 ) {
//                 cell.lableText.text = self.myArray[self.myArray.count-1-indexPath.row];
//            }
            return cell;
        }
    }else{
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }else{
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _myArray.count+1) {
        return 100;
    }
    self.myTableView.estimatedRowHeight = 44.0f;
    //    self.searchTableView.estimatedRowHeight = 44.0f;
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _myArray.count+1) {//清除所有历史记录
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清除历史记录" message:@"" preferredStyle: UIAlertControllerStyleAlert];
        
        //@“ UIAlertControllerStyleAlert，改成这个就是中间弹出"
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [ZYTokenManager removeAllArray];
            _myArray = nil;
            [self.myTableView reloadData];
            
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:deleteAction];
        //            [alertController addAction:archiveAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return;
        }
        muyiViewController *search = [muyiViewController new];
//        if (self.myArray.count!=0) {
//            
//            search.title = self.myArray[self.myArray.count-1-indexPath.row];
//        }
        [self.navigationController pushViewController:search animated:YES];
    
    }
}

-(void)readNSUserDefaults{//取出缓存的数据
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray * myArray = [userDefaultes arrayForKey:@"myArray"];
    self.myArray = myArray;
    [self.myTableView reloadData];
    NSLog(@"myArray======%@",myArray);
}


@end