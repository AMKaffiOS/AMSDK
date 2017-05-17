//
//  ViewController.m
//  AMSDK
//
//  Created by luochao on 2017/5/16.
//  Copyright © 2017年 AM. All rights reserved.
//

#import "ViewController.h"
#import <KaffADSDK/KaffADSDK.h>
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@interface ViewController ()<AMNativeAdDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loadBtn;

@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *fbAdView;
@property (weak, nonatomic) IBOutlet UIImageView *fbIconImgView;
@property (weak, nonatomic) IBOutlet UILabel *fbTitleLabel;

@property (nonatomic, strong) UIView *fbChoiceView;
@property (nonatomic, strong) UIView *fbMediaView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadAction:(id)sender {
    self.loadBtn.enabled = NO;
    self.title = @"加载中...";
    
    AMNativeAdService *adService = [AMNativeAdService defaultService];
    adService.delegate = self;
    [adService loadAdsWithPlacementId:@"pid" count:3];
}


#pragma mark - UI

- (void)reloadDataWithNativeAd:(AMNativeAd *)ad
{
    AMNativeAdService *service = [AMNativeAdService defaultService];
    
    if (ad.amAdType == AMAltaAD) {
        self.adView.hidden = NO;
        self.fbAdView.hidden = YES;
        [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:ad.coverUrl]];
        self.titleLabel.text = ad.titile;
        [service registerViewForInteraction:ad
                         withClickableViews:@[self.titleLabel,self.coverImgView]
                                  currentVC:self];
    }
    else
    {
        if (self.fbChoiceView) {
            [self.fbChoiceView removeFromSuperview];
            [self.fbMediaView removeFromSuperview];
        }
        
        self.adView.hidden = YES;
        self.fbAdView.hidden = NO;
        self.fbTitleLabel.text = ad.titile;
        [self.fbIconImgView sd_setImageWithURL:[NSURL URLWithString:ad.iconUrl]];
        self.fbChoiceView = [service fbChoiceViewWithNativeAd:ad];
        self.fbMediaView = [service fbMediaViewWithNativeAd:ad];
        if (self.fbMediaView) {
            [self.fbAdView addSubview:self.fbMediaView];
            [self.fbAdView addSubview:self.fbChoiceView];
            
            [self.fbMediaView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.fbAdView).offset(10);
                make.right.bottom.equalTo(self.fbAdView).offset(-10);
                make.top.equalTo(self.fbIconImgView.mas_bottom).offset(15);
            }];
            
            [self.fbChoiceView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.fbMediaView);
                make.top.equalTo(self.fbIconImgView);
                make.height.equalTo(@20);
                make.width.equalTo(@75);
            }];
        }
        [service registerViewForInteraction:ad
                         withClickableViews:@[self.fbAdView]
                                  currentVC:self];
    }
    
}

#pragma mark - AMNativeAdDelegate

- (void)nativeAdService:(AMNativeAdService *)nativeAdService
           didLoadedAds:(NSArray<AMNativeAd *> *)nativeAds
        withPlacementId:(NSString *)placementId
{
    self.dataArray = nativeAds;
    self.loadBtn.enabled = YES;
    self.title = [NSString stringWithFormat:@"加载成功(%zd条广告)", nativeAds.count];
    if (self.dataArray.count) {
        AMNativeAd *ad = self.dataArray[0];
        if (ad) {
            [self reloadDataWithNativeAd:ad];
        }
    }
}

- (void)nativeAdService:(AMNativeAdService *)nativeAdService loadFailed:(AMError *)error withPlacementId:(NSString *)placementId
{
    NSLog(@"nativeAdLoadFailed");
    self.loadBtn.enabled = YES;
    
    if (self.dataArray.count) {
        self.title = [NSString stringWithFormat:@"%zd条广告",self.dataArray.count];
    }
    else
    {
        self.title = @"加载失败";
    }
}

- (void)nativeAdService:(AMNativeAdService *)nativeAdService didClick:(AMNativeAd *)ad withPlacementId:(NSString *)placementId
{
    NSLog(@"click");
}

- (void)nativeAdService:(AMNativeAdService *)nativeAdService didShow:(AMNativeAd *)ad withPlacementId:(NSString *)placementId
{
    NSLog(@"show");
}



@end
