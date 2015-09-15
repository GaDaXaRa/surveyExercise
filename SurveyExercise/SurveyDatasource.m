//
//  SurveyDatasource.m
//  SurveyExercise
//
//  Created by Miguel Santiago Rodríguez on 15/9/15.
//  Copyright (c) 2015 Miguel Santiago Rodríguez. All rights reserved.
//

#import "SurveyDatasource.h"

@implementation SurveyDatasource

- (NSDictionary *)fetchSurvey {
    return @{@"preguntas":@[
                     @{@"pregunta" : @"cual es tu comida favorita?", @"respuestas":@[@"paella", @"tortilla", @"hamburguesa"]},
                     @{@"pregunta" : @"cual es tu cerveza favorita?", @"respuestas":@[@"mahou", @"estrella de galicia", @"Voll Damm"]},
                     @{@"pregunta" : @"que postura usas para dormir?",@"respuestas": @[@"boca arriba", @"boca abajo", @"de lado"]},
                     @{@"pregunta" : @"donde te gustaria ir de vacaciones?", @"respuestas": @[@"Nueva York", @"Bora bora", @"Australia"]}
                     ]
             };
}

@end
