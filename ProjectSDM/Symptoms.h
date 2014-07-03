//
//  Symptoms.h
//  ProjectSDM
//
//  Created by Mudit Bhargava on 6/26/14.
//  Copyright (c) 2014 SDM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Symptoms : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *diagnosis;
@end

@interface Symptoms (CoreDataGeneratedAccessors)

- (void)addDiagnosisObject:(NSManagedObject *)value;
- (void)removeDiagnosisObject:(NSManagedObject *)value;
- (void)addDiagnosis:(NSSet *)values;
- (void)removeDiagnosis:(NSSet *)values;

@end
