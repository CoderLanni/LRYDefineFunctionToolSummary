//
//  FirstTableViewCell.m
//  Cell中横向的Tabelview
//
//  Created by ZE KANG on 2017/5/10.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "FirstInCollectionViewCell.h"
#import "Masonry.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


@interface FirstTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSInteger num;
    NSMutableArray *listArr;
}
/**
 collectionViewCell
 */
@property(nonatomic,strong)UICollectionView *collectionView;


/**
 timeLabel
 */
@property(nonatomic,strong)UILabel *timeLabel;

/**
 expenseLabel
 */
@property(nonatomic,strong)UILabel *expenseLabel;


@end


@implementation FirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
        listArr = [[NSMutableArray alloc]init];
    }

    return self;
}

-(void)setUI{
//    self.contentView.backgroundColor = [UIColor purpleColor];
    UIView *contentBackView = [[UIView alloc] initWithFrame:CGRectMake(10, 45,kScreenWidth-20, 255)];
    contentBackView.backgroundColor = [UIColor greenColor];
    

    
//       UIView *superview = self;
//    [contentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(greenView.mas_bottom).offset(padding);
////        make.left.equalTo(superview.mas_left).offset(padding);
////        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
////        make.right.equalTo(superview.mas_right).offset(-padding);
////        make.height.equalTo(greenView.mas_height); //can pass array of attributes
//        make.top.equalTo(superview.mas_top).offset(20); //with with
//    }];
    
//    UIView *contentBackView =[[UIView alloc]init];
//    [contentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(20);
//        make.left.equalTo(self).offset(20);
//        make.bottom.equalTo(self).offset(-20);
//        make.right.equalTo(self).offset(-20);
//    }];
//    
//    UIEdgeInsets padding = UIEdgeInsetsMake(45, 10, 10, 10);
//    [contentBackView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(padding.top);
//        make.left.equalTo(self.mas_left).offset(padding.left);
//        make.bottom.equalTo(self.mas_bottom).offset(-padding.bottom);
//        make.right.equalTo(self.mas_right).offset(-padding.right);
//    }];
    contentBackView.backgroundColor = [UIColor whiteColor];
    contentBackView.layer.cornerRadius = 10;
    contentBackView.layer.masksToBounds = YES;
    [self.contentView addSubview:contentBackView];
    [contentBackView addSubview:self.expenseLabel];
    [contentBackView addSubview:self.collectionView];
    [self.contentView addSubview:self.timeLabel];
}

-(UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth-120)/2, 10, 120, 25)];
        _timeLabel.backgroundColor = [UIColor yellowColor];
        _timeLabel.layer.cornerRadius = 3;
        _timeLabel.layer.masksToBounds = YES;
        _timeLabel.text = @"2017-1-10";
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}

-(UILabel *)expenseLabel
{
    if (_expenseLabel == nil) {
        _expenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, kScreenWidth-50, 30)];
        _expenseLabel.text = @"患者已消费￥450,累计450分。";
//        _expenseLabel.font = FONT_15;
    }
    return _expenseLabel;
}

-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(110, 190);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 55, kScreenWidth-50, 190) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[FirstInCollectionViewCell class] forCellWithReuseIdentifier:@"FirstInCollectionViewCell"];
    }
    return _collectionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"行数 ==== %ld", (long)num);
    return num;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FirstInCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstInCollectionViewCell" forIndexPath:indexPath];
    NSLog(@"医药的Info ==== %@",listArr);
    cell.backgroundColor = [UIColor purpleColor];
//    cell.goodsInfoModel = listArr[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    cell.goodsInfoModel.goodsPhotoId1 = @"fdf";
    cell.goodsInfoModel.orderId = @"545454";
    cell.goodsInfoModel.goodsName = @"fdfdffd";
    cell.goodsInfoModel.goodsId= @"7353";
    cell.goodsInfoModel.specifications=@"fdfd";
    cell.goodsInfoModel.buyNumber = 3;
    cell.goodsInfoModel.doctorId = @"4545";
    cell.goodsInfoModel.goodsPrice = @"45";
    cell.goodsInfoModel.createDate = @"2017-18-18";
    cell.goodsInfoModel.orderType = 1;
    cell.goodsInfoModel.goodsMmoney = @"98";
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath--->%ld",indexPath.row);
}

-(void)setListModel:(FirstInModel *)listModel{
    self.timeLabel.text =  @"2017-9-09";
    
    //    NSLog(@"==============********* ========= %@",self.listModel);
}

-(void)setGoodsModel:(CJGoodsModel *)goodsModel
{
    self.timeLabel.text = [goodsModel.date substringToIndex:10];
    self.expenseLabel.text = [NSString stringWithFormat:@"患者已消费￥%ld,医生获得%ld积分。",(long)goodsModel.goodsMmoney,(long)goodsModel.integralPoint];
  
//    num = goodsModel.list.count;
//    listArr = goodsModel.list;
    
    num = 10;
}




@end
