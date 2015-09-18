//
//  Receipt.m
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import "Receipt.h"
#import "Tag.h"
#import "CoreDataStack.h"

@implementation Receipt

+ (Receipt *)createReceipt {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:[CoreDataStack sharedManager].context];
    
    return [[Receipt alloc] initWithEntity:entity insertIntoManagedObjectContext:[CoreDataStack sharedManager].context];
}

@end
