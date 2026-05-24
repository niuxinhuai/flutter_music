# 项目规范

## Dart 与 Flutter

- 维持 `pubspec.yaml` 中声明的 Flutter/Dart SDK 兼容范围，当前目标为 Flutter 3.29.3 / Dart 3.7.2。
- 默认遵循 `analysis_options.yaml` 引入的 `flutter_lints`。
- 文件和目录命名优先使用小写下划线；已有历史目录如 `Leaderboard` 不在无关改动中重命名。
- 优先使用项目已有 widget、颜色、主题、路由和工具类。
- 避免在 UI 中直接写复杂业务逻辑，复杂计算放到 state、effect、utils 或 model 层。

## Fish Redux 分层

- `state.dart`：只放页面状态、初始化和 `clone`。
- `action.dart`：定义 action 枚举与 ActionCreator。
- `effect.dart`：处理生命周期、接口请求、路由跳转、弹窗、播放器等副作用。
- `reducer.dart`：只做同步状态变更，不发请求、不操作 context。
- `view.dart`：根据 state 渲染 UI，通过 dispatch 触发 action。
- `page.dart`：组装 reducer、effect、view、adapter、dependencies。

## Model 与接口

- 接口模型使用 `json_annotation` / `json_serializable`。
- `*.g.dart` 只由 build_runner 生成。
- `CommonService` 的方法名保持业务语义清晰，例如 `getSongLyric`、`getRecommendPersonalized`。
- 真实接口和 mock JSON 返回结构要保持一致。
- 缓存 key 使用稳定字符串，避免把可变参数遗漏到缓存 key 中。

## UI 与资源

- 图片资源放 `assets/images/`，JSON mock 放 `assets/json/`，字体放 `assets/fonts/`。
- 新增资产后检查 `pubspec.yaml`。
- 页面间距、颜色、字号优先复用现有组件和 `lib/res/`。
- 列表和刷新优先沿用项目中的 `CustomRefreshIndicator`、`LoadingWrap` 等封装。
- 图片路径注意大小写，iOS 和 CI 环境对大小写问题更敏感。

## 错误处理与调试

- 网络请求要考虑空值、异常和接口字段缺失。
- Debug 日志可以临时使用，但交付前避免留下无意义的 `print`。
- 用户可见错误优先使用项目已有 toast、loading、error widget。
- 不在仓库提交账号、密码、token、cookie、私有接口凭据。

## 测试与质量

- 业务逻辑、工具函数和模型解析优先加单元测试。
- 页面级改动至少保证 smoke test 不被破坏。
- 每次 PR 至少说明 `flutter analyze --no-fatal-infos --no-fatal-warnings` 和 `flutter test` 的结果；历史 lint 债务清理后再收紧 analyze 门禁。
- 修复 bug 时优先补覆盖该 bug 的测试或可复现说明。
