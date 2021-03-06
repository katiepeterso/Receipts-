//
//  Receipt.h
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tag;

NS_ASSUME_NONNULL_BEGIN

@interface Receipt : NSManagedObject

+ (Receipt *)createReceipt;

@end

NS_ASSUME_NONNULL_END

#import "Receipt+CoreDataProperties.h"
