# Contra (J) disasm

> This is the first iteration of a wannabe complete disassembly of the japanese version of Contra for NES

## How to assemble

### You need

- the CHR banks to assemble it back, I currently don't provide the right tool to do so, but you could try [this](https://github.com/ZReC/rom-breakdown)
- base-devel (arch) or build-essential (debian)
- [openssl](https://github.com/openssl/openssl) for the checksum

Then you can..

```console
cd contraj-disasm/
make
```

..or if you need a clean run

```console
cd contraj-disasm/
make clean run
```

## ROM specs

The ROM needed to extract the CHR banks has the following specs:

```text
Size:     262160 bytes (256 KiB)
CRC32:    8A96A3C4
CRC64:    344A158949D912CB
SHA256:   6BA53139FA88B8DE1AE527C438BDA6F1541D1EE7DF26D63DEC5164A32D166BFE
SHA1:     376836361F404C815D404E1D5903D5D11F4EFF0E
BLAKE2sp: A970D753A851F5D16002A22E560DB2DB16AD63E375F66DD26786F629AEDFF039
```

## Contributing

### *star & fork*

Pull requests are extremely welcome! This project is **yours**.

---

## Financial Support

> *I'm here once again asking for your financial support*

<table>
<tr>
<th>Paypal</th>
</tr>
<tr>
<td>

[Donate~ ^ w ^](https://www.paypal.com/donate?hosted_button_id=JUMR575EAP8HL)
</td>
</tr>
</table>
<table>
<tr>
<th>(BTC) Bitcoin</th>
</tr>
<tr>
<td>

```text
18uE6xNeqBmAQH2JRVHmzg5D2QKVkSqxRN
```

</td>
</tr>
</table>
<table>
<tr>
<th>(XRP) Ripple</th>
<th> Dest. tag </th>
</tr>
<tr>
<td>

```text
rMdG3ju8pgyVh29ELPWaDuA74CpWW6Fxns
```

</td>
<td>

```text
3664935451
```

</td>
</tr>
</table>
<table>
<tr>
<th>(ETH) Ether</th>
</tr>
<tr>
<td>

```text
0x1A9E7259E86c2837886f6DD8B563EfeD76f83989
```

</td>
</tr>
</table>
<table>
<tr>
<th>(BAT) Basic Attention Token</th>
</tr>
<tr>
<td>

```text
0x08ae87331ABbAa69b11FCE76734910e5bC566F57
```

</td>
</tr>
</table>
