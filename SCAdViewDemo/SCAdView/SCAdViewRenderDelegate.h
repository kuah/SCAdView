//
//  SCAdViewRenderDelegate.h
//  SCAdViewDemo
//
//  Created by 陈世翰 on 17/2/7.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCAdViewRenderDelegate <NSObject>
@required
/**
 *  @brief 通过实现此代理为view或者cell来设置
 */
-(void)setModel:(id)model;
@end
