//
//  ViewController.m
//  SCAdViewDemo
//
//  Created by 陈世翰 on 17/2/7.
//  Copyright © 2017年 Coder Chan. All rights reserved.
//

#import "ViewController.h"
#import "SCAdView.h"
#import "HeroModel.h"
@interface ViewController ()<SCAdViewDelegate>
{
    SCAdView *_adView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self showAdVertically];//垂直显示
    [self showAdHorizontally];//水平显示
    
    
    CGFloat btnWidth = 100;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat margin_x = (screenWidth-btnWidth)/2;
    UIButton *btn = [[UIButton alloc]initWithFrame:(CGRect){margin_x-btnWidth-20,screenHeight-110,btnWidth,55}];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"play" forState:UIControlStateNormal];
    btn.alpha = 0.8;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:(CGRect){margin_x,screenHeight-110,btnWidth,55}];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setTitle:@"pause" forState:UIControlStateNormal];
    btn1.alpha = 0.8;
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn2 = [[UIButton alloc]initWithFrame:(CGRect){margin_x+btnWidth+20,screenHeight-110,btnWidth,55}];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"refresh" forState:UIControlStateNormal];
    btn2.alpha = 0.8;
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    
    btn.layer.masksToBounds =YES;
    btn1.layer.masksToBounds = YES;
    btn2.layer.masksToBounds = YES;
    
    btn.layer.cornerRadius = 10;
    btn1.layer.cornerRadius = 10;
    btn2.layer.cornerRadius = 10;
    
}
#pragma mark --垂直模式
/**
 *  @brief 垂直显示
 */
-(void)showAdVertically{

    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        
        //必须参数
        builder.adArray = @[@"刘备",@"李白",@"嬴政",@"韩信"];
        builder.viewFrame = (CGRect){0,0,self.view.bounds.size.width,self.view.bounds.size.height/1.5f};
        builder.adItemSize = (CGSize){self.view.bounds.size.width/2.5f,self.view.bounds.size.width/4.f};
        builder.secondaryItemMinAlpha = 0.6;//非必要参数，设置非主要广告的alpa值
        builder.autoScrollDirection = SCAdViewScrollDirectionTop;//设置垂直向下滚动
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
        
        //非必要参数
//        builder.allowedInfinite = NO;  //非必要参数 ：设置不无限循环轮播,默认为Yes
//        builder.minimumLineSpacing = 40; //非必要参数: 如需要可填写，默认会自动计算
//        builder.scrollEnabled = NO;//非必要参数
        builder.threeDimensionalScale = 1.45;//非必要参数: 若需要使用threeD效果，则需要填写放大或缩小倍数
//        builder.allowedInfinite = NO;//非必要参数 : 如设置为NO，则按所需显示，不会无限轮播,也不具备轮播功能,默认为yes
        
    }];
    adView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.2];
    adView.delegate = self;
    _adView = adView;
    [self.view addSubview:adView];
}
#pragma mark -水平模式
/**
 *  @brief 水平显示
 */
-(void)showAdHorizontally{
    NSArray *testArray =@[@"刘备",@"李白",@"嬴政",@"韩信"];
    //模拟服务器获取到的数据
    NSMutableArray *arrayFromService  = [NSMutableArray array];
    for (NSString *text in testArray) {
        HeroModel *hero = [HeroModel new];
        hero.imageName = text;
        hero.introduction = [NSString stringWithFormat:@"我是王者农药的:---->%@",text];
        [arrayFromService addObject:hero];
    }
    
    SCAdView *adView = [[SCAdView alloc] initWithBuilder:^(SCAdViewBuilder *builder) {
        builder.adArray = arrayFromService;
        builder.viewFrame = (CGRect){0,100,self.view.bounds.size.width,self.view.bounds.size.width/2.f};
        builder.adItemSize = (CGSize){self.view.bounds.size.width/2.5f,self.view.bounds.size.width/4.f};
        builder.minimumLineSpacing = 0;
        builder.secondaryItemMinAlpha = 0.6;
        builder.threeDimensionalScale = 1.45;
        builder.itemCellNibName = @"SCAdDemoCollectionViewCell";
    }];
    adView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.2];
    adView.delegate = self;
    _adView = adView;
    [self.view addSubview:adView];

}
#pragma mark -delegate

-(void)sc_didClickAd:(id)adModel{
    NSLog(@"sc_didClickAd-->%@",adModel);
    if ([adModel isKindOfClass:[HeroModel class]]) {
        NSLog(@"%@",((HeroModel*)adModel).introduction);
    }
}

-(void)sc_scrollToIndex:(NSInteger)index{
    NSLog(@"sc_scrollToIndex-->%ld",index);
}


#pragma mark -operation
-(void)play{
    [_adView play];
}
-(void)pause{
    [_adView pause];
}
-(void)refresh{
    [_adView reloadWithDataArray:@[@"李白",@"李白",@"李白",@"李白"]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
