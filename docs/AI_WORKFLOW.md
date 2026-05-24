# AI 协作流程

这份流程用于 Codex、Copilot、Claude 或其他 AI 助手接手本项目时保持一致的工作方式。

## 1. 接需求

- 先判断需求类型：页面 UI、接口模型、路由跳转、播放器/视频能力、数据缓存、构建配置、文档规范。
- 找到对应目录后再改代码。多数业务在 `lib/sections/<feature>/` 下，公共能力在 `lib/widgets/`、`lib/helper/`、`lib/repository/`、`lib/utils/`。
- 如果需求影响多个 feature，先列出受影响页面和共享层，避免只改入口不改调用方。

## 2. 设计改动

- 页面功能：沿用 Fish Redux 的 `state/action/view/reducer/effect/page` 分层。
- 纯展示组件：优先放到当前 feature 的 `widget/`；只有跨 feature 复用时才放 `lib/widgets/`。
- 接口字段：先更新 model，再通过 build_runner 生成 `*.g.dart`。
- 路由：使用 `RouterKeys` 和 `ARouter` 体系，避免散落字符串。
- Mock：`DebugUtils.debug == true` 时优先读取 `assets/json`，保证离线调试可用。

## 3. 实现顺序

1. 读相关 `state/action/view/reducer/effect/page`。
2. 补齐 model、service、route 等依赖。
3. 改 UI 或业务逻辑。
4. 运行生成代码或格式化。
5. 跑验证命令。
6. 汇总改动和风险。

## 4. 验证清单

- `flutter pub get`
- `flutter analyze --no-fatal-infos --no-fatal-warnings`
- `flutter test`
- 涉及生成代码时：`flutter pub run build_runner build --delete-conflicting-outputs`
- 涉及资源时：确认 `pubspec.yaml` 已声明，且文件路径大小写正确。
- 涉及网络时：同时检查 `DebugUtils.debug` 的本地 JSON 分支和真实接口分支。

## 5. AI 输出规范

- 先说结论，再列关键文件。
- 明确已执行和未执行的验证命令；如果使用了非 fatal lint 参数，也要写出来。
- 对失败命令给出具体错误原因或环境原因。
- 不夸大完成度，不把“未验证”说成“已通过”。
- 若发现历史问题但未修复，单独列为后续风险。
