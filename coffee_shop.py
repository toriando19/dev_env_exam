import os                                                                   
  1 import logging                                                              
  2 from http.server import HTTPServer, BaseHTTPRequestHandler                  
  3 import psycopg2                                                             
  4                                                                             
  5 logging.basicConfig(level=logging.DEBUG)                                    
  6                                                                             
  7 class HttpHandler(BaseHTTPRequestHandler):                                  
  8     def do_GET(self):                                                       
  9         try:                                                                
 10             dbname = os.environ['POSTGRES_DB']                              
 11             dbuser = os.environ['POSTGRES_USER']                            
 12             dbpass = os.environ['POSTGRES_PASSWORD']                        
 13             conn_str = f"host='db' dbname='{dbname}' user='{dbuser}'            password='{dbpass}'"                                                         14                                                                              15             with psycopg2.connect(conn_str) as connection:                   16                 cursor = connection.cursor()                                
 17                 cursor.execute('select * from coffee_beans')                 18                 rows = cursor.fetchall()                                    
 19                 db_data = "\n".join([f"Coffee Bean ID: {row[0]}, Name:          {row[1]}, Description: {row[2]}, Price: {row[3]}" for row in rows])          20                                                                              21             self.send_response(200)                                          22             self.end_headers()                                              
 23             self.wfile.write(db_data.encode('utf-8'))                        24         except Exception as e:                                              
 25             logging.exception("An error occured:")                           26             self.send_response(500)                                         
 27             self.end_headers()                                               28             self.wfile.write(str.encode("Internal Server Error"))           
 29                                                                             
 30 print('Serving coffee_shop server on 0.0.0.0:8000')                         
 31 httpd = HTTPServer(('0.0.0.0', 8000), HttpHandler)                          
 32 httpd.serve_forever()                                                       
~                              