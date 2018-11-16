package spiderman.alipay.config;

public class AlipayConfig {
    // 商户appid
    public static String APPID = "2018072760815488";
    // 私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCpkELskauSTNbM32ki7RgYBEDSNVXDaRdnt1CueznSf2TM0mYmj+5AATSDV/6R9jgG9pdvPwTkPIdVfAAje40L0XQdNYItVdzIxVhWnyBWNvpf/89p6metxPwuOOyK7AO/Tf5wn7RXptDYZrCZbT5DxXJnioSxgD9oad3vM5poQKP8umavFKKmLhH8UwUB4oho9t0l0qIQVACDMAz+F4kR2IYBMS+lRrP29HjnaV22tpViW3Flo3rGL7Hw82xwgOgo0iYz4+78+c0oK32m7aQDz93D+xgePUchbI+TwGGeWC77J0ePB57IbCirXN2mUp5KW7VPTe0ZR11LhvjIupbfAgMBAAECggEAGtU0cgFfWEiGmWclWRyR+oL5ywobp0/DH2uX/fSMIu58Ahmthp6yQjiumbZcF7cSCLAPKNCdMo0NkY6M6xCLMnqT2Gd2UTxMMw1fvF10HZCXsIdnyEgK3inVCm+Bpz5QHX73K9VqEZDZbdVaTv1FpC3ju9TkyL4Vyq0uLMNKxQJrbTtDil5XIP1jCC775jDuh971n34ZqB9lQSfXvHqGxkOLxuF6Ktzf/41Vq0rU2zvE3QReHO0SDSXByw1fQZ2Qt6esn/qhtAZA8e/9BLUuUE5DzVRpL5APiC8BaXNNNkRfz2ROd7CUK8KNlUUWCHsrwYQBOxmJ/SB5HI040R30wQKBgQDmB6YnS0QgFKnzTBvDWc1ZH1ok4Ep0kpLLm6gE4+gDNzt4fv+N3hBdxLVSIUyrVIvL0vfthAAdpAQ6EkqvmwF39XlEe8ZSQZGyNnfdsPw0K2BrtQLjCl6Rtax/VUIuMUl223jhbOmRnEl5N08zvzdlwolhbT2g+4h08FluTHEl4QKBgQC8tQGqgPgwoiP5bQAV0CY/lYEJX265fp4MCdcMagIGC1UMQ4oAEEB17fySmo6JZ/PWf/rmdoENpRl/5Zdgg+u+kUkgU7GmvNbjhfs8Ht1X6hhOvtCNQBLD7d9GN5z3O1qMF8eH7RHitQp8gm2BSIFVZOY6ui39gVXL3rY7qRHUvwKBgB0OHkicUzCSK51VobQdJbj6ItLBmeX7lZsuQBzOBMJTOanQsMrkn8CYVibXme2SMk4+iZ5wq+sSio4jPVfNBnR2hyjFUZmWOqb+Bkn0Twbv66/vHzw6VROmlPFIfaGEDDl9I1ml/iKsUQOEnvZ0UrUBy4SI3d31p5jNux4ZfblBAoGAN7ACydo9Y7y1eQndmJJQdzsbVTTAbCUdZtgQii1OY5I8it3zf4lMPID6pBjQL2Rp5Mbnt9MIyooKOF/8iBLmItqlBdEs/9OCZqpHNbq1/xeqDLLqwIREBWXRGduXiq4NToJF86rWOFzMt2mV/yzyXczk1DfVEpZ0RzF1/a0rAekCgYEA1tcpOADE2pvIsCboBhXkFOaoc6F1qpMGEyaVSHTSqQMfAZ31E/yLupXRrQQuhkDgR2lnN8eke/fdo4VQS+1z+LY4FzDqKSSEYcH41RN9vE9Dfpj7lWEqoc7pffP8bS2Kv6P6nF0GjjT+odOfpMdItGy0yHGEc97ds/jfW0+SEWw=";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://mylp.free.idcfengye.com/lsh/weixin/callback/wxCallBack/alipay.do";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://192.168.0.200/lsh/app/alipay/wappay/return_url.do";
    // 请求网关地址
    public static String URL = "https://openapi.alipay.com/gateway.do";
    //public static String URL = "https://openapi.alipaydev.com/gateway.do";
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtMDBo7uzIXVThdeOCezMiuvPvvy7AnX8ZyXewRezm2pWiaAUNiaE7+n9qbmW15K2Hq+PT+qnww7aM3Yep9VXmE8JEDXIBhEArSYM+8TUziOl2aS6xU9htHE3HXpPVYP4ZvEg4xUCNH/omDoRzeB8+Ame8oC9vz0P21ZSxPI6yj6UNEJOlWMiN6XpPj7J5UMiMBxsGJ3bZxr7D3uPsqLE5El9UBdJN/RZT83zZfZ6mzI0TheARcdPjDAoOrlkhELGzjiV1nmhOb0yBq0geqyp8+yDOWO2xWyBxtYqr5dIdnVJGEhfxhgIJbduTkqMigyhx3YF4M2Wkv1ocYFRHdUIZwIDAQAB";
    // 日志记录目录
    public static String log_path = "/log";
    // RSA2
    public static String SIGNTYPE = "RSA2";
}
