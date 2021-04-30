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
exec_path: ""                     # 启动chrome的路径
disable_headless: false           # 禁用无头模式
force_sandbox: false              # 强制开启sandbox；为 false 时默认开启沙箱，但在容器中会关闭沙箱。为true时强制启用沙箱，可能导致在docker中无法使用。
enable_image: false               # 启用图片显示
parent_path_detect: true          # 是否启用父目录探测功能
proxy: ""                         # 代理配置
user_agent: ""                    # 请求user-agent配置
domain_headers:                   # 请求头配置:[]{domain,map[headerKey]HeaderValue}
  - domain: '*'                   # 为哪些域名设置header，glob语法
    headers: {                    # 请求头，map[key]value
      Cookie: somecookie
    }                    
max_depth: 10                     # 最大页面深度限制
navigate_timeout_second: 10       # 访问超时时间，单位秒
load_timeout_second: 10           # 加载超时时间，单位秒
retry: 0                          # 页面访问失败后的重试次数
page_analyze_timeout_second: 300  # 页面分析超时时间，单位秒
max_interactive: 1000             # 单个页面最大交互次数
max_interactive_depth: 10         # 页面交互深度限制
max_page_concurrent: 10           # 最大页面并发（不大于10）
max_page_visit: 1000              # 总共允许访问的页面数量
max_page_visit_per_site: 1000     # 每个站点最多访问的页面数量
element_filter_strength: 0        # 过滤同站点相似元素强度，1-7取值，强度逐步增大，为0时不进行跨页面元素过滤
new_task_filter_config: # 检查某个链接是否应该被加入爬取队列
  hostname_allowed: [ ]            # 允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  hostname_disallowed: [ ]         # 不允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  port_allowed: [ ]                # 允许访问的端口, 支持的格式如: 80、80-85
  port_disallowed: [ ]             # 不允许访问的端口, 支持的格式如: 80、80-85
  path_allowed: [ ]                # 允许访问的路径，支持的格式如: test、*test*
  path_disallowed: [ ]             # 不允许访问的路径, 支持的格式如: test、*test*
  query_key_allowed: [ ]           # 允许访问的 Query Key，支持的格式如: test、*test*
  query_key_disallowed: [ ]        # 不允许访问的 Query Key, 支持的格式如: test、*test*
  fragment_allowed: [ ]            # 允许访问的 Fragment, 支持的格式如: test、*test*
  fragment_disallowed: [ ]         # 不允许访问的 Fragment, 支持的格式如: test、*test*
  post_key_allowed: [ ]            # 允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
  post_key_disallowed: [ ]         # 不允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
request_send_filter_config: # 检查某个请求是否应该被发送
  hostname_allowed: [ ]            # 允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  hostname_disallowed: [ ]         # 不允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  port_allowed: [ ]                # 允许访问的端口, 支持的格式如: 80、80-85
  port_disallowed: [ ]             # 不允许访问的端口, 支持的格式如: 80、80-85
  path_allowed: [ ]                # 允许访问的路径，支持的格式如: test、*test*
  path_disallowed: [ ]             # 不允许访问的路径, 支持的格式如: test、*test*
  query_key_allowed: [ ]           # 允许访问的 Query Key，支持的格式如: test、*test*
  query_key_disallowed: [ ]        # 不允许访问的 Query Key, 支持的格式如: test、*test*
  fragment_allowed: [ ]            # 允许访问的 Fragment, 支持的格式如: test、*test*
  fragment_disallowed: [ ]         # 不允许访问的 Fragment, 支持的格式如: test、*test*
  post_key_allowed: [ ]            # 允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
  post_key_disallowed: [ ]         # 不允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
request_output_filter_config: # 检查某个请求是否应该被输出
  hostname_allowed: [ ]            # 允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  hostname_disallowed: [ ]         # 不允许访问的 Hostname，支持格式如 t.com、*.t.com、1.1.1.1、1.1.1.1/24、1.1-4.1.1-8
  port_allowed: [ ]                # 允许访问的端口, 支持的格式如: 80、80-85
  port_disallowed: [ ]             # 不允许访问的端口, 支持的格式如: 80、80-85
  path_allowed: [ ]                # 允许访问的路径，支持的格式如: test、*test*
  path_disallowed: [ ]             # 不允许访问的路径, 支持的格式如: test、*test*
  query_key_allowed: [ ]           # 允许访问的 Query Key，支持的格式如: test、*test*
  query_key_disallowed: [ ]        # 不允许访问的 Query Key, 支持的格式如: test、*test*
  fragment_allowed: [ ]            # 允许访问的 Fragment, 支持的格式如: test、*test*
  fragment_disallowed: [ ]         # 不允许访问的 Fragment, 支持的格式如: test、*test*
  post_key_allowed: [ ]            # 允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
  post_key_disallowed: [ ]         # 不允许访问的 Post Body 中的参数, 支持的格式如: test、*test*
```

## 讨论

如有问题可以在 GitHub 提 issue, 也可在下方的讨论组里

1. GitHub issue: https://github.com/chaitin/xray/issues
1. QQ 群: 717365081
1. 微信群: 扫描以下二维码加我的个人微信，会把大家拉到 `xray` 官方微信群    

<img src="https://docs.xray.cool/assets/wechat.jpg?nocache=2" height="200px">


