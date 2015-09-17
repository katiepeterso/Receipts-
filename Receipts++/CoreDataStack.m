//
//  CoreDataStack.m
//  Receipts++
//
//  Created by Katherine Peterson on 2015-09-17.
//  Copyright © 2015 KatieExpatriated. All rights reserved.
//

#import "CoreDataStack.h"
@import CoreData;

@interface CoreDataStack ()

@property (nonatomic)NSManagedObjectModel *mom;
@property (nonatomic) NSPersistentStoreCoordinator *psc;

@end


@implementation CoreDataStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *momdURL = [[NSBundle mainBundle]URLForResource:@"Receipts__" withExtension:@"momd"];
        self.mom = [[NSManagedObjectModel alloc]initWithContentsOfURL:momdURL];
        self.psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.mom];
        
        NSString *storeString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:@"datastore.sqlite"];
        NSURL *storeURL = [NSURL fileURLWithPath:storeString];

        NSError *storeError = nil;
        NSString *failureReason = @"There was an error creating or loading the application's saved data.";
        if (![self.psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&storeError]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
            dict[NSLocalizedFailureReasonErrorKey] = failureReason;
            dict[NSUnderlyingErrorKey] = storeError;
            storeError = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", storeError, [storeError userInfo]);
            abort();

        }
        
        self.context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        self.context.persistentStoreCoordinator = self.psc;
    }
    return self;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.context;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *receipt = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.context];
    [fetchRequest setEntity:receipt];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

@end
