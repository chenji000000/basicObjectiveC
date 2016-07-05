//
//  AddContactViewController.h
//  Demo01-CoreData-Contact
//
//  Created by tarena on 15/11/30.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Contact.h"

@interface AddContactViewController : UIViewController
@property (nonatomic, strong) NSFetchedResultsController *resultsController;
@property (nonatomic, strong) Contact *contact;

@end
