//
//  NewsModel.h
//  DangAn
//
//  Created by Viatom on 16/7/26.
//  Copyright © 2016年 lijiang. All rights reserved.
//

#import "LXBaseModel.h"

@interface NewsModel : LXBaseModel

@property(nonatomic,copy)NSString *news_id; //新闻的id
@property(nonatomic,copy)NSString *title;// 标题
@property(nonatomic,copy)NSString *thumb;// 图片的路径
@property(nonatomic,copy)NSString *time;// 时间

@end
