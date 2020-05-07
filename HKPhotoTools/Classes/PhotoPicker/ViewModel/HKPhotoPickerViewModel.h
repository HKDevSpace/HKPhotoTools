//
//  HKPhotoPickerViewModel.h
//  Pods
//
//  Created by HK on 2020/4/26.
//

#import <Foundation/Foundation.h>
#import "HKPhotoInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface HKPhotoPickerViewModel : NSObject

+ (instancetype)defaultViewModel;


- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsAtSection:(NSInteger)section;
- (nullable HKPhotoInfo *)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
