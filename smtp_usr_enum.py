import socket

alpha = "abcdefghijklmnopqrstuvwxyz"
max = 99999
wordlist = []

for letter in alpha:
    uid = letter
    for i in range(max):
        str_i=str(i)
        temp = "{:<0"+str(6-len(str_i))+"}"
        uid =temp.format(uid)+str_i
        wordlist.append(uid)
        uid = letter


HOST = "" 
PORT = 25

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST,PORT))
    s.send("EHLO\r\n".encode())
    s.recv(1024)
    s.send("MAIL FROM:user@example.com\r\n".encode())
    msg = s.recv(1024).decode()
    if msg[:3] == "250" :
        for uid in wordlist:
            #uid = uid + "@example.com"
            s.send("RCPT TO:{}\r\n".format(uid).encode())
            msg = s.recv(1024).decode()
            if msg[:3] == "250" :
                print("[SUCCESS]{}\t\t\t{}".format(uid,msg))
    
#for uid in wordlist:
    