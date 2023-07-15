---
template: reveal.html
search:
  exclude: true
---

## Web Technologies
# Week 1 - INTROCUCTION
Bertil Chapuis

---

```javascript [1-2|3|4]
let a = 1;
let b = 2;
let c = x => 1 + 2 + x;
console.log(c(3));
```

---

## Overview of Today's Class

- Internet
- World Wide Web (WWW)
- Uniform Resource Locator (URL)
- HyperText Transfer Protocol (HTTP)
- Hypertext Markup Language (HTML) 
- Cascading Style Sheets (CSS)

---

## Internet's Conceptual Model

The **Internet Protocol Suite** is the conceptual model and set of communications protocols used in the Internet and similar computer networks.
- The **Application Layer** specifies the shared communications protocols and interface methods used by hosts in a communications network.<br>**Examples:** HTTP, HTTPS, FTP, SSH, SMTP, IMAP, Telnet, etc.
- The **Transport Layer** provide host-to-host communication services, such as connection-oriented communication, reliability, and flow control.<br>**Examples:** TCP, UDP, etc.
- The **Internet Layer** transports packets from the originating host across network boundaries to the destination host specified by an IP address.<br>**Examples:** IP, ICMP (traceroute), IPsec (VPN), etc.
- The **Link Layer** is the group of methods and communications protocols that operate on the link that a host is physically connected to.<br>**Examples:** ARP, PPP, MAC (Ethernet, Wifi, DSL, Fiber), etc.

https://en.wikipedia.org/wiki/Internet_protocol_suite

---

## <i class="fab fa-js"></i> Higher-Order Functions

Higher-order functions allow us to abstract over actions, not just values. 
For example, we can have functions that create new functions.

```javascript
function greaterThan(n) {
	return m => m > n;
}
let greaterThan10 = greaterThan(10);
console.log(greaterThan10(11)); // true
```

https://eloquentjavascript.net/05_higher_order.html

---

## Mozilla's Definition

The World Wide Web - commonly referred to as WWW, W3, or the Web - is an interconnected system of public webpages accessible through the Internet. The Web is not the same as the Internet: the Web is one of many applications built on top of the Internet.

The system we know today as "the Web" consists of several components:
- The HTTP protocol governs data transfer between a server and a client.
- To access a Web component, a client supplies a unique universal identifier, called a URL (uniform resource location) or URI (uniform resource identifier).
- HTML (hypertext markup language) is the most common format for publishing web documents.

https://developer.mozilla.org/en-US/docs/Glossary/World_Wide_Web
