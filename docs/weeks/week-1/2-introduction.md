---
template: reveal.html
search:
  exclude: true
---

## Web Technologies
# Week 1 - INTROCUCTION
Bertil Chapuis

---

```js [1-2|3|4]
let a = 1;
let b = 2;
let c = x => 1 + 2 + x;
c(3);
```

---

## <i class="fas fa-tasks"></i> Overview of Today's Class

- Internet

- World Wide Web (WWW)

- Uniform Resource Locator (URL)

- HyperText Transfer Protocol (HTTP)

- Hypertext Markup Language (HTML) 

- Cascading Style Sheets (CSS)

---

## Internet's Conceptual Model

The <b>Internet Protocol Suite</b> is the conceptual model and set of communications protocols used in the Internet and similar computer networks.
- The <b>Application Layer</b> specifies the shared communications protocols and interface methods used by hosts in a communications network.<br>**Examples:** HTTP, HTTPS, FTP, SSH, SMTP, IMAP, Telnet, etc.
- The <b>Transport Layer</b> provide host-to-host communication services, such as connection-oriented communication, reliability, and flow control.<br>**Examples:** TCP, UDP, etc.
- The <b>Internet Layer</b> transports packets from the originating host across network boundaries to the destination host specified by an IP address.<br>**Examples:** IP, ICMP (traceroute), IPsec (VPN), etc.
- The <b>Link Layer</b> is the group of methods and communications protocols that operate on the link that a host is physically connected to.<br>**Examples:** ARP, PPP, MAC (Ethernet, Wifi, DSL, Fiber), etc.

https://en.wikipedia.org/wiki/Internet_protocol_suite

---

## <i class="fab fa-js"></i> Higher-Order Functions

Higher-order functions allow us to abstract over actions, not just values. 
For example, we can have functions that create new functions.

```js
function greaterThan(n) {
	return m => m > n;
}
let greaterThan10 = greaterThan(10);
console.log(greaterThan10(11)); // true
```

https://eloquentjavascript.net/05_higher_order.html
