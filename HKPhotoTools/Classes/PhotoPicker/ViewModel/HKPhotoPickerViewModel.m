//
//  HKPhotoPickerViewModel.m
//  Pods
//
//  Created by HK on 2020/4/26.
//

#import "HKPhotoPickerViewModel.h"

@interface HKPhotoPickerViewModel ()

@property (strong, nonatomic) NSMutableArray <HKPhotoInfo *>*photoInfoArray;

@end


@implementation HKPhotoPickerViewModel

#pragma mark - Constructor And Destructor
+ (instancetype)defaultViewModel
{
    
    return nil;
}

#pragma mark - Override

#pragma mark - Public
- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsAtSection:(NSInteger)section
{
    return 100;
}

- (nullable HKPhotoInfo *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - Actions





#pragma mark - Private

#pragma mark - Setter

#pragma mark - Getter
- (NSMutableArray<HKPhotoInfo *> *)photoInfoArray
{
    if (!_photoInfoArray) {
        _photoInfoArray = [[NSMutableArray alloc] init];
    }
    return _photoInfoArray;;
}

@end
