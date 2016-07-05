//
//  People+CoreDataProperties.h
//  Demo01-CoreData-Manual
//
//  Created by tarena on 15/11/28.
//  Copyright © 2015年 tarena. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "People.h"

NS_ASSUME_NONNULL_BEGIN

@interface People (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSNumber *height;

@end

NS_ASSUME_NONNULL_END
