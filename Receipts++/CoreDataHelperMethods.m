//
//  CoreDataHelperMethods.m
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import "CoreDataHelperMethods.h"
@import CoreData;
#import "Receipt.h"
#import "CoreDataStack.h"
#import "Tag.h"

@implementation CoreDataHelperMethods

+(void)saveNewReceipt:(Receipt *)receipt {
    
    receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:[CoreDataStack sharedManager].context];
    [[CoreDataStack sharedManager] saveContext];
}

+(void)saveTags {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:[CoreDataStack sharedManager].context];
    
    Tag *food = [[Tag alloc]initWithEntity:entity insertIntoManagedObjectContext:[CoreDataStack sharedManager].context];
    food.tagName = @"Food";
    
    Tag *bills = [[Tag alloc]initWithEntity:entity insertIntoManagedObjectContext:[CoreDataStack sharedManager].context];
    bills.tagName = @"Bills";
    
    Tag *business = [[Tag alloc]initWithEntity:entity insertIntoManagedObjectContext:[CoreDataStack sharedManager].context];
    business.tagName = @"Business";
    
    Tag *entertainment = [[Tag alloc]initWithEntity:entity insertIntoManagedObjectContext:[CoreDataStack sharedManager].context];
    entertainment.tagName = @"Entertainment";
    
    [[CoreDataStack sharedManager] saveContext];
}

@end
