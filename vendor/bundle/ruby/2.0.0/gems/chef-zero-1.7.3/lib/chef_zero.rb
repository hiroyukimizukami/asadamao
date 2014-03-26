module ChefZero
  require 'chef_zero/log'

  CERTIFICATE = "-----BEGIN CERTIFICATE-----\nMIIDMzCCApygAwIBAgIBATANBgkqhkiG9w0BAQUFADCBnjELMAkGA1UEBhMCVVMx\nEzARBgNVBAgMCldhc2hpbmd0b24xEDAOBgNVBAcMB1NlYXR0bGUxFjAUBgNVBAoM\nDU9wc2NvZGUsIEluYy4xHDAaBgNVBAsME0NlcnRpZmljYXRlIFNlcnZpY2UxMjAw\nBgNVBAMMKW9wc2NvZGUuY29tL2VtYWlsQWRkcmVzcz1hdXRoQG9wc2NvZGUuY29t\nMB4XDTEyMTEyMTAwMzQyMVoXDTIyMTExOTAwMzQyMVowgZsxEDAOBgNVBAcTB1Nl\nYXR0bGUxEzARBgNVBAgTCldhc2hpbmd0b24xCzAJBgNVBAYTAlVTMRwwGgYDVQQL\nExNDZXJ0aWZpY2F0ZSBTZXJ2aWNlMRYwFAYDVQQKEw1PcHNjb2RlLCBJbmMuMS8w\nLQYDVQQDFCZVUkk6aHR0cDovL29wc2NvZGUuY29tL0dVSURTL3VzZXJfZ3VpZDCC\nASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANLDmPbR71bS2esZlZh/HfC6\n0azXFjl2677wq2ovk9xrUb0Ui4ZLC66TqQ9C/RBzOjXU4TRf3hgPTqvlCgHusl0d\nIcLCrsSl6kPEhJpYWWfRoroIAwf82A9yLQekhqXZEXu5EKkwoUMqyF6m0ZCasaE1\ny8niQxdLAsk3ady/CGQlFqHTPKFfU5UASR2LRtYC1MCIvJHDFRKAp9kPJbQo9P37\nZ8IU7cDudkZFgNLmDixlWsh7C0ghX8fgAlj1P6FgsFufygam973k79GhIP54dELB\nc0S6E8ekkRSOXU9jX/IoiXuFglBvFihAdhvED58bMXzj2AwXUyeAlxItnvs+NVUC\nAwEAATANBgkqhkiG9w0BAQUFAAOBgQBkFZRbMoywK3hb0/X7MXmPYa7nlfnd5UXq\nr2n32ettzZNmEPaI2d1j+//nL5qqhOlrWPS88eKEPnBOX/jZpUWOuAAddnrvFzgw\nrp/C2H7oMT+29F+5ezeViLKbzoFYb4yECHBoi66IFXNae13yj7taMboBeUmE664G\nTB/MZpRr8g==\n-----END CERTIFICATE-----\n"
  PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0sOY9tHvVtLZ6xmVmH8d\n8LrRrNcWOXbrvvCrai+T3GtRvRSLhksLrpOpD0L9EHM6NdThNF/eGA9Oq+UKAe6y\nXR0hwsKuxKXqQ8SEmlhZZ9GiuggDB/zYD3ItB6SGpdkRe7kQqTChQyrIXqbRkJqx\noTXLyeJDF0sCyTdp3L8IZCUWodM8oV9TlQBJHYtG1gLUwIi8kcMVEoCn2Q8ltCj0\n/ftnwhTtwO52RkWA0uYOLGVayHsLSCFfx+ACWPU/oWCwW5/KBqb3veTv0aEg/nh0\nQsFzRLoTx6SRFI5dT2Nf8iiJe4WCUG8WKEB2G8QPnxsxfOPYDBdTJ4CXEi2e+z41\nVQIDAQAB\n-----END PUBLIC KEY-----\n"
  PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA0sOY9tHvVtLZ6xmVmH8d8LrRrNcWOXbrvvCrai+T3GtRvRSL\nhksLrpOpD0L9EHM6NdThNF/eGA9Oq+UKAe6yXR0hwsKuxKXqQ8SEmlhZZ9GiuggD\nB/zYD3ItB6SGpdkRe7kQqTChQyrIXqbRkJqxoTXLyeJDF0sCyTdp3L8IZCUWodM8\noV9TlQBJHYtG1gLUwIi8kcMVEoCn2Q8ltCj0/ftnwhTtwO52RkWA0uYOLGVayHsL\nSCFfx+ACWPU/oWCwW5/KBqb3veTv0aEg/nh0QsFzRLoTx6SRFI5dT2Nf8iiJe4WC\nUG8WKEB2G8QPnxsxfOPYDBdTJ4CXEi2e+z41VQIDAQABAoIBAALhqbW2KQ+G0nPk\nZacwFbi01SkHx8YBWjfCEpXhEKRy0ytCnKW5YO+CFU2gHNWcva7+uhV9OgwaKXkw\nKHLeUJH1VADVqI4Htqw2g5mYm6BPvWnNsjzpuAp+BR+VoEGkNhj67r9hatMAQr0I\nitTvSH5rvd2EumYXIHKfz1K1SegUk1u1EL1RcMzRmZe4gDb6eNBs9Sg4im4ybTG6\npPIytA8vBQVWhjuAR2Tm+wZHiy0Az6Vu7c2mS07FSX6FO4E8SxWf8idaK9ijMGSq\nFvIS04mrY6XCPUPUC4qm1qNnhDPpOr7CpI2OO98SqGanStS5NFlSFXeXPpM280/u\nfZUA0AECgYEA+x7QUnffDrt7LK2cX6wbvn4mRnFxet7bJjrfWIHf+Rm0URikaNma\nh0/wNKpKBwIH+eHK/LslgzcplrqPytGGHLOG97Gyo5tGAzyLHUWBmsNkRksY2sPL\nuHq6pYWJNkqhnWGnIbmqCr0EWih82x/y4qxbJYpYqXMrit0wVf7yAgkCgYEA1twI\ngFaXqesetTPoEHSQSgC8S4D5/NkdriUXCYb06REcvo9IpFMuiOkVUYNN5d3MDNTP\nIdBicfmvfNELvBtXDomEUD8ls1UuoTIXRNGZ0VsZXu7OErXCK0JKNNyqRmOwcvYL\nJRqLfnlei5Ndo1lu286yL74c5rdTLs/nI2p4e+0CgYB079ZmcLeILrmfBoFI8+Y/\ngJLmPrFvXBOE6+lRV7kqUFPtZ6I3yQzyccETZTDvrnx0WjaiFavUPH27WMjY01S2\nTMtO0Iq1MPsbSrglO1as8MvjB9ldFcvp7gy4Q0Sv6XT0yqJ/S+vo8Df0m+H4UBpU\nf5o6EwBSd/UQxwtZIE0lsQKBgQCswfjX8Eg8KL/lJNpIOOE3j4XXE9ptksmJl2sB\njxDnQYoiMqVO808saHVquC/vTrpd6tKtNpehWwjeTFuqITWLi8jmmQ+gNTKsC9Gn\n1Pxf2Gb67PqnEpwQGln+TRtgQ5HBrdHiQIi+5am+gnw89pDrjjO5rZwhanAo6KPJ\n1zcPNQKBgQDxFu8v4frDmRNCVaZS4f1B6wTrcMrnibIDlnzrK9GG6Hz1U7dDv8s8\nNf4UmeMzDXjlPWZVOvS5+9HKJPdPj7/onv8B2m18+lcgTTDJBkza7R1mjL1Cje/Z\nKcVGsryKN6cjE7yCDasnA7R2rVBV/7NWeJV77bmzT5O//rW4yIfUIg==\n-----END RSA PRIVATE KEY-----\n"
end