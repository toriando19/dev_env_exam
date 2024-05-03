 DROP TABLE IF EXISTS coffee_beans;                                          
  1                                                                             
  2 CREATE TABLE coffee_beans (                                                 
  3     id SERIAL PRIMARY KEY,                                                  
  4     title VARCHAR(50),                                                      
  5     description TEXT,                                                       
  6     price INTEGER                                                           
  7 );                                                                          
  8                                                                             
  9                                                                             
 10                                                                             
 11 INSERT INTO coffee_beans (title, description, price)                        
 12 VALUES                                                                      
 13    ('Arabica', 'Arabica beans are known for their smooth and mild flavor        profile with subtle acidity. They often have floral and fruity notes,           making them popular for specialty coffees.', 20                             
 14 ),                                                                          
 15     ('Robusta', 'Robusta beans have a stronger, more robust flavor compared     to Arabica beans. They are often higher in caffeine content and have a more     bitter taste with earthy and woody notes.', 15),                            
 16     ('Ethiopian Yirgacheffe', 'These beans are known for their bright           acidity, floral aroma, and fruity flavor notes. Ethiopian Yirgacheffe is        prized for its complex and vibrant taste profile.', 25)                     
 17 ;                                                                           
 18                                                                             
 19                                             