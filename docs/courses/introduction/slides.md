---
template: reveal.html
search:
  exclude: true
---

# Introduction

Bertil Chapuis

<!--  -->
## Overview of Today's Class

- Internet
- World Wide Web (WWW)
- Uniform Resource Locator (URL)
- HyperText Transfer Protocol (HTTP)
- Hypertext Markup Language (HTML) 
- Cascading Style Sheets (CSS)

<!--  -->
## Internet

<!--  -->
### Internet's Conceptual Model

The **Internet Protocol Suite** is the conceptual model and set of communications protocols used in the Internet and similar computer networks.

- The **Application Layer** specifies the shared communications protocols and interface methods used by hosts in a communications network.<br>**Examples:** HTTP, HTTPS, FTP, SSH, SMTP, IMAP, Telnet, etc.
- The **Transport Layer** provide host-to-host communication services, such as connection-oriented communication, reliability, and flow control.<br>**Examples:** TCP, UDP, etc.
- The **Internet Layer** transports packets from the originating host across network boundaries to the destination host specified by an IP address.<br>**Examples:** IP, ICMP (traceroute), IPsec (VPN), etc.
- The **Link Layer** is the group of methods and communications protocols that operate on the link that a host is physically connected to.<br>**Examples:** ARP, PPP, MAC (Ethernet, Wifi, DSL, Fiber), etc.

source: https://en.wikipedia.org/wiki/Internet_protocol_suite

<!--  -->
### Internet's Conceptual Model

![Networking](/web-course/courses/introduction/assets/network_reminder.svg)

<!-- <table>
		<tr>
				<th>OSI</th>
				<th>Internet Protocol Suite</th>
				<th>Protocols</th>
				<th>Data Unit</th>
		</tr>
		<tr>
				<td>Application</td>
				<td rowspan="3" class="centered">Application Layer</td>
				<td rowspan="3" class="centered">HTTP/HTTPS</td>
				<td rowspan="3" class="centered">Request/Response</td>
		</tr>
		<tr>
				<td>Presentation</td>
		</tr>
		<tr>
				<td>Session</td>
		</tr>
		<tr>
				<td rowspan="2" class="centered">Transport</td>
				<td rowspan="2" class="centered">Transport Layer</td>
				<td>SSL/TLS</td>
				<td rowspan="2" class="centered">Segment</td>
		</tr>
		<tr>
				<td>TCP/UDP</td>
		<tr>
				<td>Network</td>
				<td>Internet Layer</td>
				<td>IP</td>
				<td>Packet/Datagram</td>
		</tr>
		<tr>
				<td>Data Link</td>
				<td rowspan="2" class="centered">Link Layer</td>
				<td>Ethernet/WiFi</td>
				<td>Frame</td>
		</tr>
		<tr>
				<td>Physical</td>
				<td>Wire/Fiber</td>
				<td>Signal</td>
		</tr>
</table> -->

<!--  -->
### Domain Name System

The <b>Domain Name System (DNS)</b> is a hierarchical and decentralized naming system (phone book) for computers connected to the Internet. 
It translates domain names to IP addresses needed for locating and identifying computers.

![Network DNS](/web-course/courses/introduction/assets/network_dns.svg)

<!-- ```plantuml
@startuml
!define osaPuml https://raw.githubusercontent.com/Crashedmind/PlantUML-opensecurityarchitecture2-icons/master
!include osaPuml/Common.puml
!include osaPuml/Hardware/all.puml
!include osaPuml/Misc/all.puml
!include osaPuml/Server/all.puml
!include osaPuml/Site/all.puml

together {
	osa_desktop(computer, "192.169.1.10","Computer")
	osa_server(http_server, "192.169.1.10", "HTTP Server")
}
osa_server(dns_resolver, "23.34.54.67","DNS Resolver")
osa_server(root_server, "56.34.54.67","Root Server")
osa_server(tld_server, "23.36.54.67","Top Level Domain (TLD)")
osa_server(name_server, "34.34.54.67","Name Server")

http_server -r-> computer : Request
computer -l-> http_server : Response

computer -r-> dns_resolver : www.example.com
dns_resolver -l-> computer : www.example.com = 3.3.3.3

dns_resolver -u-> root_server: www.example.com
root_server -d-> dns_resolver: com = 1.1.1.1
dns_resolver -d-> tld_server: www.example.com
tld_server -u-> dns_resolver: example.com = 2.2.2.2
dns_resolver -r-> name_server : www.example.com
name_server -l-> dns_resolver : www.example.com = 3.3.3.3

@enduml
``` -->

The DNS protocol uses <b>TCP</b> for Zone transfer and <b>UDP</b> for name queries.

<!--  -->
### Zone file

- A Domain Name System (DNS) zone file is a text file that describes a DNS zone. 
- A DNS zone is a subset, often a single domain, of the hierarchical domain name structure of the DNS. 
- The zone file contains mappings between domain names and IP addresses and other resources, organized in the form of text representations of resource records (RR).

<!--  -->
### Zone file example

```text
$ORIGIN example.com.    ; start of this zone
$TTL 1h                 ; default expiration time
example.com.  IN  MX    10 mail.example.com.  ; mailserver for example.com
example.com.  IN  A     192.0.2.1             ; IPv4 address for example.com
example.com.  IN  AAAA  2001:db8:10::1        ; IPv6 address for example.com
www           IN  CNAME example.com.          ; alias for example.com
```

<!--  -->
### More about DNS

Mozilla provides a nice cartoon of how DNS works, what are its limitations in terms of security and privacy, and why DNS over HTTPS is needed.

https://hacks.mozilla.org/2018/05/a-cartoon-intro-to-dns-over-https/

Cloudflare provides a good introduction to DNS, DNS amplification attacks and DNS flood attacks.

https://www.cloudflare.com/learning/ddos/glossary/domain-name-system-dns/

<!--  -->
### Hands on!

Perform some DNS lookups with the following commands:

```bash
nslookup -type=any heig-vd.ch
dig heig-vd.ch
```

Perform a reverse DNS lookup with the host command:

```bash
host wikipedia.org
host 91.198.174.192
```

Query the whois directory to check domain name ownership:

```bash
whois heig-vd.ch
```

Print the route packets trace to network host:

```bash
traceroute heig-vd.ch
```

<!--  -->
## World Wide Web (WWW)

<!--  -->
### Mozilla's Definition

The World Wide Web - commonly referred to as WWW, W3, or the Web - is an interconnected system of public webpages accessible through the Internet. The Web is not the same as the Internet: the Web is one of many applications built on top of the Internet.

The system we know today as "the Web" consists of several components:
- The HTTP protocol governs data transfer between a server and a client.
- To access a Web component, a client supplies a unique universal identifier, called a URL (uniform resource location) or URI (uniform resource identifier).
- HTML (hypertext markup language) is the most common format for publishing web documents.

https://developer.mozilla.org/en-US/docs/Glossary/World_Wide_Web

<!--  -->
### Mozilla's Definition

Tim Berners-Lee proposed the architecture of what became known as the World Wide Web. He created the first web server, web browser, and webpage at the CERN in 1990. 
In 1991, he announced his creation, marking the moment the Web was first made public. 

![Tim Berners-Lee](/web-course/courses/introduction/assets/web_tim.jpg) <!-- .element width="40%" -->

Today, the Web is constently evolving under the guidance of the World Wide Web Consortium (W3C).

source: https://worldwideweb.cern.ch/

<!--  -->
### Mozilla's Definition

![HTTP Layer](/web-course/courses/introduction/assets/HTTP_layers.png) <!-- .element width="60%" -->

source: https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview

<!--  -->
### Other Resources

https://www.w3.org/standards/

https://www.w3.org/2019/09/TPAC/

https://whatwg.org/

https://developer.mozilla.org/fr/docs/Web/API

<!--  -->
## Uniform Resource Locator (URL)

<!--  -->
### What's in an URL?
A Uniform Resource Locator (URL), colloquially termed a web address, is a reference to a web resource that specifies its location on a computer network and a mechanism for retrieving it.

```
https://username:password@example.com:443/index.html?param=value#fragment
```

<table>
		<thead>
		<tr>
		<th>Part</th>
		<th>Value</th>
		<th>Description</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>Scheme</td>
		<td><code class="remark-inline-code">https://</code></td>
		<td>The protocol to use for the request.</td>
		</tr>
		<tr>
		<td>Credentials</td>
		<td><code class="remark-inline-code">username:password@</code></td>
		<td>The credentials to use for the request (Basic Auth).</td>
		</tr>
		<tr>
		<td>Domain</td>
		<td><code class="remark-inline-code">example.com</code></td>
		<td>The domain name where to send the request.</td>
		</tr>
		<tr>
		<td>Port</td>
		<td><code class="remark-inline-code">:443</code></td>
		<td>The port of service endpoint.</td>
		</tr>
		<tr>
		<td>Path</td>
		<td><code class="remark-inline-code">/index.html</code></td>
		<td>The path of the resource.</td>
		</tr>
		<tr>
		<td>Query</td>
		<td><code class="remark-inline-code">?param=value</code></td>
		<td>The parameters associated with the resource.</td>
		</tr>
		<tr>
		<td>Fragment</td>
		<td><code class="remark-inline-code">#fragment</code></td>
		<td>The path of a secondary resource.</td>
		</tr>
		</tbody>
</table>

<!--  -->
## Hypertext Transfer Protocol (HTTP)

<!--  -->
### Mozilla's Definition

HTTP is a protocol which allows the fetching of resources, such as HTML documents. It is the foundation of any data exchange on the Web and it is a client-server protocol, which means requests are initiated by the recipient, usually the Web browser. A complete document is reconstructed from the different sub-documents fetched, for instance text, layout description, images, videos, scripts, and more.

![The Web](/web-course/courses/introduction/assets/Fetching_a_page.png) <!-- .element width="550" style="background-color:white" -->

source: https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview

<!--  -->
### Hands on!

The Unix world is at the origin of many popular text protocols, such FTP, POP3, SMTP or IMAP.

HTTP follows the same philosophy, which allows to easily observe what transit on the network. 

Use telnet to open a TCP connection and perform a simple get request.

```bash
telnet www.google.com 80
GET / HTTP/1.1
Host: www.google.com
```
<!--  -->
### HTTP Requests

```bash
GET /200?param=value HTTP/1.1
Host: httpstat.us
User-Agent: curl/7.58.0
Accept: */*
```

**Requests** usually have:
- a method (`GET`)
- a resource (`/200?param=value`)
- some headers (e.g. `User-Agent: curl/7.58.0`)
- an optional body (depends on the methods)

The most common **Methods** are:
- `GET`: Returns the resource.
- `POST`: Create resource.
- `HEAD`: Returns the headers of resource.
- `PUT`: Create or update resource.
- `DELETE`: Deletes resource:

<!--  -->
### HTTP Responses

```bash
HTTP/1.1 200 OK
Content-Length: 6
Content-Type: text/plain; charset=utf-8
Server: Microsoft-IIS/10.0
Access-Control-Allow-Origin: *
Date: Mon, 16 Sep 2019 20:07:29 GMT
200 OK
```    

**Responses** usually have:
- a status code (`200 OK`)
- some headers (e.g. `Content-Length: 6`)
- an optional body (text, HTML, json)

The most common **Status Codes** are:
- `200 OK`: The request has succeeded (2xx Success).
- `301 Moved Permanently`: The resource has a new location (3xx Redirection).
- `404 Not Found`: The server has not found the resource (4xx Client Error).
- `500 Internal Server Error`: The server has not found the resource (5xx Server).

<!--  -->
### Hands on!

HTTPS complicated the observability a bit!

But [CURL](https://curl.haxx.se/) takes care of it for you:

```bash
curl -v https://httpstat.us/200?param=value
```

Or have a look at the DevTools in Chrome (CTRL+SHIFT+I):

![Dev tools](/web-course/courses/introduction/assets/http_devtools.png) <!-- .element width="550" -->

<!--  -->
### Hands on!

Credentials and tokens can be captured by eavesdropping.

What happen when you run the following command while listening with [Wireshark](https://www.wireshark.org/)? 

What does the Authorization header contains?

```bash
curl http://username:password@www.heig-vd.ch
```

![Wireshark](/web-course/courses/introduction/assets/wireshark.png)

<!--  -->
### Hands on!

Get to know your methods and status codes!

- What is status code `418`?

<!--  -->
### `418 - I'm a teapot`

source: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/418

The HTTP 418 I'm a teapot client error response code indicates that the server refuses to brew coffee because it is a teapot. This error is a reference to Hyper Text Coffee Pot Control Protocol which was an April Fools' joke in 1998.

<!--  -->
### Other Resources

https://gumroad.com/l/http-zine/buy-one-give-one

<!--  -->
## Hello, World!

<!--  -->
### Web Application Architecture

![Wireshark](/web-course/courses/introduction/assets/web-application.svg) <!-- .element width="60%" -->

<!--  -->
### Demonstration

- Chrome Dev Tools (Console, Network, etc.)
- NVM
- Node.js
- HTML/CSS/JS
- Visual Studio Code
- Github Classroom
- ESLint

<!--  -->
## Questions
