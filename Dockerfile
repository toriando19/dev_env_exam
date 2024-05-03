FROM python:3.8-slim-buster                                                 
  1                                                                             
  2 ADD requirements.txt /                                                      
  3 RUN pip install --upgrade pip                                               
  4 RUN pip install -r requirements.txt                                         
  5                                                                             
  6 WORKDIR /app/                                                               
  7 COPY . /app/                                                                
  8                                                                             
  9 COPY ./entrypoint.sh /                                                      
 10 ENTRYPOINT ["sh", "/entrypoint.sh"] 