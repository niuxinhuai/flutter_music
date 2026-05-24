# API 接入说明

项目默认使用 `UrlConstants.defaultBaseUrl` 中的历史 Vercel 镜像地址。这个地址不是稳定后端，线上调试建议自行部署一份兼容 NeteaseCloudMusicApi 的服务，并通过 `--dart-define` 指定。

## 1. 启动 API 服务

可以使用 Docker 启动一份本地服务：

```bash
docker run -d -p 3000:3000 --name netease_cloud_music_api binaryify/netease_cloud_music_api
```

启动后先验证常用接口：

```bash
curl 'http://127.0.0.1:3000/search?keywords=周杰伦&type=1'
curl 'http://127.0.0.1:3000/song/url/v1?id=115162&level=standard'
```

如果本地服务无法满足播放链接、登录或解灰需求，可以替换成你维护的云端部署地址。

## 2. Flutter 指定 API 地址并关闭 mock

运行 App 时传入 `NETEASE_API_BASE_URL`，并用 `USE_MOCK_DATA=false` 关闭本地 mock：

```bash
flutter run \
  --dart-define=NETEASE_API_BASE_URL=http://127.0.0.1:3000 \
  --dart-define=USE_MOCK_DATA=false
```

iOS 模拟器通常可以访问宿主机的 `127.0.0.1`。Android 模拟器如访问不到宿主机本地服务，尝试使用：

```bash
flutter run \
  --dart-define=NETEASE_API_BASE_URL=http://10.0.2.2:3000 \
  --dart-define=USE_MOCK_DATA=false
```

保持默认配置时，`USE_MOCK_DATA` 为 `true`，多数页面会读取 `assets/json` 下的本地 mock 数据，不会请求真实接口。

## 3. 当前播放链接接口

项目播放链接已使用新版路径：

```text
/song/url/v1?id=<songId>&level=standard
```

默认音质是 `standard`。如果后续要支持选择音质，可以在调用 `MusicUri.song_url(id, level: 'exhigh')` 时传入 `higher`、`exhigh`、`lossless` 等值，但高音质通常依赖登录态和版权状态。
