//
//  HKPhotoPicker.h
//  Pods
//
//  Created by HK on 2020/4/26.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, HKPhotoPickerSourceType) {
    HKPhotoPickerSourceTypeImage = 1 << 0,
    HKPhotoPickerSourceTypeVideo = 1 << 1,
};


NS_ASSUME_NONNULL_BEGIN

API_AVAILABLE(ios(9))
@interface HKPhotoPicker : NSObject

+ (HKPhotoPicker *)photoPicker;



- (void)fetchAssets;


@end

NS_ASSUME_NONNULL_END
