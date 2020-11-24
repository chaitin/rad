<h1 align="center">Rad</h1>

rad，全名 `Radium`，名字来源于放射性元素——镭, 从一个URL开始，辐射到一整个站点空间

> 一款专为安全扫描而生的浏览器爬虫

## 下载地址

https://github.com/chaitin/rad/releases


## 快速使用

在使用之前，请务必阅读并同意 [Disclaimer](./Disclaimer.md)文件中的条款，否则请勿安装使用本工具。

本工具需要提前装好新版本的 **`chrome`**，否则将无法使用 

1. 基本使用

    ```
    rad -t http://example.com
    ```

2. 需要手动登录的情况
    
    ```
    rad -t http://example.com -wait-login
    ```

执行以上命令会自动禁用无头浏览模式，开启一个浏览器供手动登录。
在登录完毕后在命令行界面点击回车键继续爬取。

3. 将爬取基本结果导出为文件

    ```
    rad -t http://example.com -text-output result.txt
    ```

以上命令会将爬取到的URL输出到result.txt中
格式为 `Method URL` 例：`GET http://example.com`

4. 导出完整请求

    ```
    rad -t http://example.com -full-text-output result.txt
    ```
    

5. 导出完整请求为JSON

    ```
    rad -t http://example.com -json result.json
    ```    

6. 与xray联动

    * 社区版：设置上级代理为xray监听地址
        运行xray：

        ```
        xray webscan --listen 127.0.0.1:7777 --html-output proxy.html
        ```

        运行rad：

        ```
        rad -t http://example.com -http-proxy 127.0.0.1:7777
        ```

    * 高级版对 rad 进行了深度融合，下载后可以一键使用：

        ```
        xray webscan --browser-crawler http://example.com --html-output vuln.html
        ```

## 参数配置

rad首次运行后会自动在当前目录生成rad_config.yml配置文件

```yaml
enable-image-display: false                  # 启用图片显示，适用于需要验证码登录的情况，启用wait-login自动开启
load-wait: 2                                 # 页面加载完毕后的等待时间，单位秒，网速不佳时可尝试调大该值
exec-path: ""                                # 启动chrome的路径，为空会自动在默认路径寻找
disable-headless: false                      # 禁用无头模式
request-config:                              # 请求头配置
  user-agent: ""                             # 请求user-agent配置
  headers:                                   # 请求header配置
  - key: ""                                  # header的key
    value: ""                                # header的value
  cookies:                                   # 请求cookie配置
  - name: ""                                 # cookie的name
    value: ""                                # cookie的value
restrictions-on-urls:                        # 对爬取的URL的一些限制项
  disallowed-suffix: []                      # 不允许的文件后缀
  disallowed-keywords-in-path-and-query: []  # 不允许的URL关键字
  disallowed-domain: []                      # 不允许的域名
  disallowed-urls: []                        # 不允许的URL（正则）
  allowed-domains: []                        # 允许的域名，起始目标会被自动加入其中
  allowed-urls: []                           # 允许的URL（正则）
restrictions-on-requests:                    # 对请求行为的一些限制项
  max-concurrent: 10                         # 最大页面并发（不大于10）
  max-depth: 5                               # 最大页面深度限制
  max-click-depth: 5                         # 一个页面中最大点击深度限制
  max-count-of-page: 1000                    # 最多爬取的页面数量限制
  max-click-or-event-trigger: 1000           # 单个页面中最大点击或事件触发次数(不大于10000)
  click-or-event-interval: 1000              # 点击间隔，单位毫秒

```

## 讨论

如有问题可以在 GitHub 提 issue, 也可在下方的讨论组里

1. GitHub issue: https://github.com/chaitin/xray/issues
1. QQ 群: 717365081
1. 微信群: 扫描以下二维码加我的个人微信，会把大家拉到 `xray` 官方微信群    

<img src="https://docs.xray.cool/assets/wechat.jpg?nocache=2" height="200px">


