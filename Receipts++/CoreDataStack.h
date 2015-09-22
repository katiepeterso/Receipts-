//
//  CoreDataStack.h
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface CoreDataStack : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSManagedObjectContext *context;

- (void)saveContext;

+ (CoreDataStack *)sharedManager;

@end




