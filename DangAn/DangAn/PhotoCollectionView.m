//
//  PhotoCollectionView.m
//  WXMovie
//
//  Created by wei.chen on 15/8/10.
//  Copyright (c) 2015年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "LSPhotoCell.h"

/**
 *  1.创建子视图
 *  2.子视图展现数据
 */


@implementation PhotoCollectionView {
    NSString *_identify;
}


- (instancetype)initWithFrame:(CGRect)frame {
    //1.创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置单元格的尺寸
    flowLayout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    //设置滑动的方向：水平方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];

    if (self) {
        
        
        //2.设置代理
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        //3.注册单元格
        _identify = @"LSPhotoCell";
        [self registerClass:[LSPhotoCell class] forCellWithReuseIdentifier:_identify];
    }
    
    return self;
}


#pragma mark - UICollectionView delegate 协议方法
//创建单元格 协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.urls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     LSPhotoCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identify forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor redColor];
    
    cell.urlstring = self.urls[indexPath.row];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"yeshu" object:nil userInfo:@{@"row":[NSString stringWithFormat:@"%d",indexPath.row+1]}];
    
    return cell;
}


//单元格结束显示
- (void)collectionView:(UICollectionView *)collectionView  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {

    //让cell单元格里面的imageView回复到1倍
    LSPhotoCell *pCell = (LSPhotoCell *)cell;
    [pCell.scrollView setZoomScale:1 animated:NO];
    
}


@end
