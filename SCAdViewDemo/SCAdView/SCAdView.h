//
//  SCAdView.h
//  SCAdViewDemo
//
//  Created by 陈世翰 on 17/2/7.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCAdViewRenderDelegate.h"

///将builder的LINE_SPACING设置为该值则会自动计算合适的间距
#define SC_BUILDER_LINE_SPACING_AUTO -10001
typedef NS_ENUM(NSInteger,SCAdViewScrollDirection) {
    SCAdViewScrollDirectionRight = 0,//轮播向右
    SCAdViewScrollDirectionLeft,//轮播向左
    SCAdViewScrollDirectionBotom,//轮播向下
    SCAdViewScrollDirectionTop,//轮播向上
};
@interface SCAdViewBuilder : NSObject
#pragma mark -必要参数
/**
 *   必填：广告模型数组
 */
@property (nonatomic,strong)NSArray *adArray;
/**
 *   view frame
 */
@property (nonatomic,assign)CGRect viewFrame;
/**
 *   广告的大小 advertisement's item size
 */
@property (nonatomic,assign)CGSize adItemSize;
/**
 *   最小行间距
 */
@property (nonatomic,assign)CGFloat minimumLineSpacing;
/**
 *  非当前广告的alpha值 如果不需要，填负数
 */
@property (nonatomic,assign) CGFloat secondaryItemMinAlpha;
/**
 *   adItem 的 nib   (与class只能二选一)
 */
@property (nonatomic,strong)NSString *itemCellNibName;
/**
 *   adItem 的 Class (与nil 只能二选一)
 */
@property (nonatomic,strong)NSString *itemCellClassName;
/**
 *   是否允许拖拽
 */
@property (nonatomic,assign)BOOL scrollEnabled;

#pragma mark -非必要参数，有默认值
/**
 *   无限轮播间隔
 */
@property (nonatomic,assign)NSTimeInterval infiniteCycle;
/**
 *   scroll direction 轮播的方向 默认为向右
 */
@property (nonatomic,assign)SCAdViewScrollDirection autoScrollDirection;
/**
 *   最小item间距
 */
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
/**
 *   3D缩放值，若为0，则为2D广告    3D scale  if threeDimensionalScale<0,it will use 2D
 */
@property (nonatomic,assign)CGFloat threeDimensionalScale;
/**
 *   无限轮播 默认为yes     Default is Yes
 */
@property (nonatomic,assign)BOOL allowedInfinite;

@end

@protocol SCAdViewRenderDelegate;

@protocol SCAdViewDelegate <NSObject>
/**
 *  @brief 滑动到的广告的index
 */
-(void)sc_scrollToIndex:(NSInteger)index;
/**
 *  @brief 点击了广告，返回广告信息
 */
-(void)sc_didClickAd:(id)adModel;

@end

@interface SCAdView : UIView
@property (nonatomic,weak)id<SCAdViewDelegate>delegate;
/**
 *  @brief 构造方法
 *  @param builderBlock 通过在block中配置builder中的参数来实现对广告view的不同设置
 *  @return SCAdView
 */
-(instancetype)initWithBuilder:(void (^) (SCAdViewBuilder *builder))builderBlock;
/**
 *  @brief 开始播放
 */
-(void)play;
/**
 *  @brief 停止播放
 */
-(void)pause;
/**
 *  @brief 刷新内容
 *  @param adArray 内容数组
 */
-(void)reloadWithDataArray:(NSArray *)adArray;
@end
