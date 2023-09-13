---
title: "تانل معکوس"
weight: 5
description: >
  تانل از سرور خارج به سرور داخلی با روش تانل معکوس (reverse)
---

## تانل مستقیم
در روش های تانلیگ، ارتباط کاربر A با سرور داخلی ‌B به صورت معمولی برقرار میشود.

ارتباط سرورها از طریق اتصال بین خروجی سرور B با ورودی سرور C انجام میشود.

![](../v2ray-tunnel.png)

## تانل معکوس
در روش معکوس اما از طریق دو تنظیم مخصوص، به صورت سرور C به صرور ‌B انجام میشود:
1. پرتال (portal): دو ورودی را به همدیگر متصل میکند (سرور B)
2. پل (bridge): دو خروجی را به همدیگر متصل میکند (سرور C)

![](../reverse-proxy.png)

در این روش ایجاد ارتباط وظیفه سرور خارج (C) است و به دلیل اینکه بیشتر سیستم فیلترینگ فقط ارتباط شبکه محلی به شبکه اینترنت را مختل میکند، این ارتباط برقرار خواهد ماند. بهترین ویژگی این روش این است که حتی سرورهای فیلتر شده هم میتوانند از این خاصیت استفاده کنند.

* در صورت قطعی دوطرفه شبکه، این ارتباطات نیز تحت تاثیر قرار خواهند گرفت.

نمونه کد برای این مدل ارتباط را میتوانید در ادامه بررسی کنید.

### پیکربندی پل
یک پل معمولاً به دو خروجی نیاز دارد، یکی برای اتصال به پورتال و دیگری برای ارسال ترافیک واقعی. یعنی برای تشخیص این دو نوع ترافیک باید از مسیریابی استفاده کنید.

پیکربندی معکوس پروکسی:
```json
{
  "bridges": [
    {
      "tag": "bridge",
      "domain": "test.xray.com"
    }
  ]
}
```

پیکربندی خروجی:
```json
{
  "tag": "out",
  "protocol": "freedom",
  "settings": {}
},
{
  "protocol": "vless",
  "settings": {
    "vnext": [
      {
        "address": "portal's IP address",
        "port": 1024,
        "users": [
          {
            "id": "5783a3e7-e373-51cd-8642-c83782b807c5"
          }
        ]
      }
    ]
  },
  "tag": "interconn"
}
```

پیکربندی قوانین مسیریابی:
```json
{
  "rules": [
    {
      "type": "field",
      "inboundTag": ["bridge"],
      "domain": ["full:test.xray.com"],
      "outboundTag": "interconn"
    },
    {
      "type": "field",
      "inboundTag": ["bridge"],
      "outboundTag": "out"
    }
  ]
}
```

### پیکربندی پرتال
در پورتال به دو ورودی نیاز دارد، یکی برای دریافت اتصالات از پل، و دیگری برای دریافت ترافیک واقعی. همچنین باید بین این دو نوع ترافیک با استفاده از مسیریابی تمایز ایجاد کنید.

پیکربندی معکوس پروکسی:
```json
{
  "portals": [
    {
      "tag": "portal",
      "domain": "test.xray.com" // Must be the same as the bridge's configuration
    }
  ]
}
```

پیکربندی ورودی:
```json
{
  "tag": "external",
  "port": 80,
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024,
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [
      {
        "id": "5783a3e7-e373-51cd-8642-c83782b807c5"
      }
    ]
  }
}
```

پیکربندی قوانین مسیریابی:
```json
{
  "rules": [
    {
      "type": "field",
      "inboundTag": ["external"],
      "outboundTag": "portal"
    },
    {
      "type": "field",
      "inboundTag": ["interconn"],
      "outboundTag": "portal"
    }
  ]
}
```

بیشتر بخوانید:
1. https://xtls.github.io/en/config/reverse.html
2. https://www.v2ray.com/en/configuration/reverse.html
3. https://guide.v2fly.org/en_US/app/reverse.html