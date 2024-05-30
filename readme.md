<div align="center">
   <p>
      <img src="https://i.ibb.co/Hhb8bd0/numpad-modified.png" width=100 alt="logo.png">
   </p>
   <h1> numpadiOS </h1> 
  An application that allows you to use your iPhone as a numpad for a computer! Once configured, a simple QR code scan and you're good to go !
   </h1>
</div>
<br>


## Why?

I made this iOS application because I needed an *ad-free* iPhone numpad that would allow me to use my iPhone as a numpad for my computer.

## Q&A

**Q : How does it work?**

*A : It works with LAN and node.JS. Make sure your computer and your phone are connected on the same network. Please also follow in-app setup instrinctions*

**Q : Does it work with macOS or Linux ?**

*A : Yes ! Windows, macOS and Linux are supported ! (Note : It might not work properly on every linux distro)*

**Q : Will it be available on the App Store ?**

*A : Yes, it will be as a free app.*

## Running server
```
git clone https://github.com/c22dev/numpadiOS
cd numpadiOS
npm install express robotjs qrcode node-pty iface
node server.js
```

## Credits

[diyar3](https://github.com/diyar2137237243) - Numpad UI (touches/faces)

Please note that diyar3 was the original owner of the idea and of the repo. After a missunderstanding on his side, he deleted the repo and left the app developement. He probably won't work on this app anymore. I still respect his work and still credit him on the github page. He won't be present in credits after a complete rewrite of his code.

[twostraws](https://github.com/twostraws/) - [CodeScanner](twostraws)
