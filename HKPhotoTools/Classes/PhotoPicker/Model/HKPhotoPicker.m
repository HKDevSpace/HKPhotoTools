//
//  HKPhotoPicker.m
//  Pods
//
//  Created by HK on 2020/4/26.
//


// PHAsset 用于从Photos Library中，获取图片、视频、现场图片（Live Photoi， 一张三秒动态视频的图片）
// 支持最低版本iOS 8+

// PHAsset 获取到的是图片的元数据（metadata），可能图片本身并非存在手机硬盘中，硬盘中的只是缩略图。
// 如果需要做一个相册展示集合视图，那么可以用 PHImageManager 管理下载、生成、缓存缩略图。

// 图片资源对象是不可变的，如果要编辑元数据，那么创建 PHAssetChangeRequest 对象， 更多实现细节，请查看 PHPhotoLibrary.


#import "HKPhotoPicker.h"
#import <Photos/Photos.h>


@implementation HKPhotoPicker

#pragma mark - Constructor And Destructor

#pragma mark - Public
+ (HKPhotoPicker *)photoPicker
{
    return [[HKPhotoPicker alloc] init];
}

- (void)fetchAssets
{
     // 1. 获取当前授权状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    // 2. 处理授权状态
    [self processAuthorizationStatus:status];
}


#pragma mark - Override


#pragma mark - Actions


#pragma mark - Private


- (BOOL)processAuthorizationStatus:(PHAuthorizationStatus)status
{
    BOOL authorized = NO;
    
    switch (status) {
        case PHAuthorizationStatusNotDetermined: {
            
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                [self processAuthorizationStatus:status];
            }];
            

        } break;
        case PHAuthorizationStatusRestricted: {
            NSLog(@"无相册权限");
        } break;
        case PHAuthorizationStatusDenied: {
            NSLog(@"用户拒接App访问无相册权限");
        } break;
            
        case PHAuthorizationStatusAuthorized: {
            NSLog(@"用户允许App访问无相册权限");
            // TODO: 获取相册信息
            authorized  = YES;
            // 授权
            [self fetchAssetsWhenUserAuthorized];
        } break;;
        default:
            break;
    }
    
    return authorized;
}

//
- (void)fetchAssetsWhenUserAuthorized
{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
//    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    
    PHFetchResult <PHAsset *> *assets = [PHAsset fetchAssetsWithOptions:options];
    
    NSLog(@"");
      
    [assets enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [[PHImageManager defaultManager] requestImageForAsset:obj targetSize:CGSizeMake(80, 80) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            NSLog(@"");
        }];
    }];
    
    // Fetch By MediaType
    PHFetchResult <PHAsset *> *imageassets = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    
    [imageassets enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"Image Asset : %@ %lu %@", obj, idx, obj.burstIdentifier);
    }];
    
    
    
    PHFetchResult <PHAsset *> *videoAssets = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeVideo options:options];
    PHFetchResult <PHAsset *> *audioAssets = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeAudio options:options];
    
    PHFetchResult<PHAssetCollection *> *assetsCollection = [PHAssetCollection fetchMomentsWithOptions:options];
    PHFetchResult<PHAssetCollection *> *smartAlbum = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:options];
    
    PHFetchResult<PHCollection *> *collection = [PHCollection fetchTopLevelUserCollectionsWithOptions:nil];
    
//    PHFetchResult <PHCollectionList *> *collectionList = [PHCollectionList ];
    

    
    
    // Fetch By Collection
    
    
  
}

#pragma mark - Setter

#pragma mark - Getter

@end
