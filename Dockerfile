FROM python:3.8-slim-buster                                                 
                                                                            
ADD requirements.txt /                                                      
RUN pip install --upgrade pip                                               
RUN pip install -r requirements.txt                                         
                                                                            
WORKDIR /app/                                                               
COPY . /app/                                                                
                                                                            
COPY ./entrypoint.sh /                                                      
ENTRYPOINT ["sh", "/entrypoint.sh"] 