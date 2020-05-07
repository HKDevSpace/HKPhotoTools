//
//  HKPhotoPickerView.h
//  Pods
//
//  Created by HK on 2020/4/26.
//

#import <UIKit/UIKit.h>
#import "HKPhotoPickerViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HKPhotoPickerView : UIView

@property (strong, nonatomic, readonly) HKPhotoPickerViewModel *viewModel;

- (instancetype)initWithViewModel:(HKPhotoPickerViewModel *)viewModel;



@end

NS_ASSUME_NONNULL_END
