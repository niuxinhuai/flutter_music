# flutter_music AI 工作规范

本仓库是一个 Flutter 仿网易云音乐客户端，主要技术栈是 Flutter 3.29.3、Dart 3.7.2、Fish Redux、Dio、SmartRefresher、json_serializable。AI 或自动化工具改动代码前先读本文件，再按 `docs/AI_WORKFLOW.md` 和 `docs/PROJECT_STANDARDS.md` 执行。

## 项目地图

- `lib/main.dart`：应用入口，挂载 `ApplicationPage`。
- `lib/sections/<feature>/page/`：Fish Redux 页面目录，通常包含 `state.dart`、`action.dart`、`view.dart`、`reducer.dart`、`effect.dart`、`page.dart`。
- `lib/sections/<feature>/widget/`：业务内组件。
- `lib/sections/<feature>/models/`、`lib/models/`：接口模型；`*.g.dart` 是生成文件。
- `lib/repository/services/common_service.dart`：网易云接口和本地 JSON mock 数据入口。
- `lib/helper/`：路由、服务、用户态、SP 等辅助层。
- `lib/res/`、`assets/`：主题、颜色、图标字体、图片、mock JSON。
- `test/`：Flutter 测试。

## AI 工作流

1. 明确需求归属：先定位涉及的 feature、route、model、service，再决定是否需要新增页面、组件、模型或接口。
2. 小步改动：优先沿用已有 Fish Redux 文件拆分，不做大范围重构，不迁移状态管理框架。
3. 生成代码：改动 `@JsonSerializable` 模型后运行 `flutter pub run build_runner build --delete-conflicting-outputs`，不要手写对应的 `*.g.dart`。
4. 验证顺序：能跑则依次执行 `flutter pub get`、`flutter analyze --no-fatal-infos --no-fatal-warnings`、`flutter test`。如果旧依赖或环境导致失败，要在交付说明中记录失败命令和原因。
5. 交付说明：说明改了哪些文件、为什么这么改、验证结果、剩余风险。不要隐藏未验证的内容。

## 代码约束

- 保持 `pubspec.yaml` 中声明的 Flutter/Dart SDK 兼容范围，不随意引入更高 SDK 才支持的语法或 API。
- UI 代码沿用当前 `Container`、`Image.asset`、自定义 widget、项目颜色资源等风格。
- Fish Redux 中副作用放在 `effect.dart`，状态变更放在 `reducer.dart`，`view.dart` 只负责渲染和派发 action。
- 接口访问优先走 `CommonService` / `ServiceHelper`，调试数据优先复用 `assets/json` 和 `JsonStringConstants`。
- 新增资源必须同步 `pubspec.yaml` 的 `assets` 或 `fonts` 配置。
- 不提交本地机器路径、证书、密钥、账号、Cookie、缓存和构建产物。

## Git 与提交

- 不回滚用户已有改动，除非用户明确要求。
- 生成文件、格式化、依赖锁文件变更要和触发它们的源码变更一起解释清楚。
- PR 需包含测试结果；不能测试时说明原因。
