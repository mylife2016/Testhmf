//
//  ViewController.m
//  aaaaaaa
//
//  Created by Mac on 16/3/5.
//  Copyright © 2016年 候孟范. All rights reserved.
//

#import "ViewController.h"

#define dWIDTH  [UIScreen mainScreen].bounds.size.width
#define dHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)NSInteger aaa;


@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createCollection];
    
     NSArray * arrr = @[@"热门",@"关注",@"红人",@"设计师"];
    for (int i = 0; i<4; i++) {
        UIButton * chouseStyleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        chouseStyleBtn.frame = CGRectMake(i*dWIDTH/4, 5, dWIDTH/4, dWIDTH/5-5);
        [chouseStyleBtn setTitle:arrr[i] forState:UIControlStateNormal];
        [chouseStyleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        chouseStyleBtn.tag = 1000+i;
        [chouseStyleBtn addTarget:self action:@selector(chouseButtonClicke:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:chouseStyleBtn];
        
    }

    
}
- (void)chouseButtonClicke:(UIButton*)sender {
    _aaa = sender.tag;
    NSLog(@"%ld",_aaa);
    [_collectionView reloadData];
}

- (void)createCollection{
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection: UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 5;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, dWIDTH/5, dWIDTH, dHEIGHT) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    _collectionView.bounces = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //    [_muarr addObject:@" "];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 10;
    
    // return _arr.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray * arr = cell.contentView.subviews;
    for (UIView * view in arr) {
        [view removeFromSuperview];
    }
    
    
    if (indexPath.section == 0 && _aaa == 1001 && indexPath.item == 0 ) {
        cell.contentView.backgroundColor = [UIColor greenColor];
        
    }
    else if (indexPath.section == 0 && _aaa != 1001 && indexPath.item == 1 ) {
        cell.contentView.backgroundColor = [UIColor orangeColor];
        
    }
    else
    
    {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    
    
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    if ([_arr[indexPath.item] isMemberOfClass:[SheQuModels class]]){
    //        CGSize size = CGSizeMake(dWIDTH, dWIDTH);
    //        return size;
    //
    //    }
    //
    //    else{
    //        CGSize size = CGSizeMake(dWIDTH, 1.5*dWIDTH+255);
    //        return size;
    //
    //    }
    if (indexPath.section == 0 && _aaa == 1001 && indexPath.item == 0) {
        CGSize size = CGSizeMake(dWIDTH, 200);
        
        return size;
        
    }
    else if (indexPath.section == 0 && _aaa == 1001 && indexPath.item == 1) {
        CGSize size = CGSizeMake(dWIDTH, 0);
        
        return size;
        
    }
   else if(indexPath.section == 0 && _aaa != 1001 && indexPath.item == 0) {
        CGSize size = CGSizeMake(dWIDTH, 0);
        
        return size;
        
    }
    else if (indexPath.section == 0 && _aaa != 1001 && indexPath.item == 1) {
        CGSize size = CGSizeMake(dWIDTH, 120);
        
        return size;
        
    }



    else{
        CGSize size = CGSizeMake(dWIDTH, 100);
        return size;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
