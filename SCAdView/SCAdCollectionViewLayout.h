//
//  SCAdCollectionViewLayout.h
//  SCAdViewDemo
//
//  Created by 陈世翰 on 17/2/7.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCCollectionViewFlowLayoutDelegate <NSObject>

-(void)sc_collectioViewScrollToIndex:(NSInteger)index;

@end
@interface SCAdCollectionViewLayout : UICollectionViewFlowLayout
/**
 *  非当前广告的alpha值
 */
@property (nonatomic,assign) CGFloat secondaryItemMinAlpha;
/**
 *  3D缩放值，若为0，则为2D广告
 */
@property (nonatomic,assign)CGFloat threeDimensionalScale;
/**
 *   循环起始点
 */
@property (nonatomic,assign)NSInteger cycleIndex;
/**
 *  代理
 */
@property (nonatomic,assign) id<SCCollectionViewFlowLayoutDelegate>delegate;
@end
