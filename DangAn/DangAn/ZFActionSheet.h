//
//  ZFActionSheet.h
//  YXJ
//
//  Created by 张锋 on 16/4/26.
//  Copyright © 2016年 成都寸芒网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFActionSheet;

typedef enum {
    ZFActionSheetStyleDefault, // 正常字体样式
    ZFActionSheetStyleCancel,  // 粗体字样式
    ZFActionSheetStyleDestructive // 红色字体样式
} ZFActionSheetStyle;

@protocol ZFActionSheetDelegate <NSObject>
/**
 *  代理方法
 *
 *  @param actionSheet actionSheet
 *  @param index       被点击按钮是哪个
 */
- (void)clickAction:(ZFActionSheet *)actionSheet atIndex:(NSUInteger)index;
@end

@interface ZFActionSheet : UIView
/**
 *  设置代理
 */
@property (nonatomic, weak) id<ZFActionSheetDelegate> delegate;
/**
 *  初始化方法
 *
 *  @param title    提示内容
 *  @param confirms 选项标题数组
 *  @param cancel   取消按钮标题
 *  @param style    显示样式
 *
 *  @return         actionSheet
 */
+ (ZFActionSheet *)actionSheetWithTitle:(NSString *)title confirms:(NSArray *)confirms cancel:(NSString *)cancel style:(ZFActionSheetStyle)style;
/**
 *  显示方法
 *
 *  @param obj UIView或者UIWindow类型
 */
- (void)showInView:(id)obj;
@end
