//
//  Contact+CoreDataProperties.h
//  Demo01-CoreData-Contact
//
//  Created by tarena on 15/11/30.
//  Copyright © 2015年 tarena. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *signature;

@end

NS_ASSUME_NONNULL_END
