# OpenClaw 设置文档

记录 OpenClaw 的安装和配置过程。

## 安装信息
- **安装日期**: 2026-03-23
- **版本**: OpenClaw 2026.3.13
- **安装路径**: C:\Users\18576\AppData\Local\pnpm\openclaw.ps1

## 配置项目

### 1. 开机自启动
- 快捷方式位置: `C:\Users\18576\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\OpenClaw.lnk`
- 启动脚本: `D:\OpenClawData\workspace\launch_openclaw.bat`
- 状态: ✅ 已配置

### 2. Control UI 令牌
```
3f0dd002555fda5d8a4b47160a4db4823887663909d5c0df
```

### 3. 工作空间
- 路径: `D:\OpenClawData\workspace`
- 包含: AGENTS.md, SOUL.md, USER.md, MEMORY.md 等

## 问题记录

### 已解决问题
1. ✅ 开机自启动配置
2. ✅ 桌面快捷方式创建
3. ✅ Control UI 令牌获取

### 待解决问题
1. 🔄 Qwen 模型认证过期
   - 需要运行: `openclaw models auth login --provider qwen-portal`

## 使用技巧

### 常用命令
```bash
# 检查状态
openclaw status

# 查看日志
openclaw logs --follow

# 重启服务
openclaw gateway restart
```

### 控制面板
- 地址: http://127.0.0.1:18789/
- 令牌: 见上方

---
*创建: 2026-03-23 | 更新: 2026-03-23*