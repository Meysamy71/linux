import os
import subprocess
import socket
import datetime
import telebot

bot = telebot.TeleBot(token='TOKEN')


x = datetime.datetime.now()
MyTime=x.strftime("%Y-%b-%d %H:%M:%S")


IP=socket.gethostbyname(socket.gethostname())
HostName=os.uname()[1]

msgc = "Today "+MyTime+"\n"+"Server Name: "+HostName+"\n"+"IP: "+IP+"\n"+"Internet Is Connected"
msgd = "Today "+MyTime+"\n"+"Server Name: "+HostName+"\n"+"IP: "+IP+"\n"+"Internet Is Disconnected"


response = subprocess.run('ping -c 1 google.com',stdout=subprocess.PIPE, shell=True)

if response.returncode == 0:
    print("Internet Is Connected")
    bot.send_message(CHANELID, msgc)
else:
    print("Internet Is Disconnected")
    bot.send_message(CHANELID, msgd)

