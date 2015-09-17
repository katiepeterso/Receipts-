//
//  Receipt+CoreDataProperties.h
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDecimalNumber *amount;
@property (nullable, nonatomic, retain) NSString *receiptDescription;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSSet<Tag *> *tags;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addTagsObject:(Tag *)value;
- (void)removeTagsObject:(Tag *)value;
- (void)addTags:(NSSet<Tag *> *)values;
- (void)removeTags:(NSSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
