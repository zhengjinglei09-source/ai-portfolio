#!/usr/bin/env bash
# 一键部署作品集到 GitHub Pages
# 用法：解压 portfolio.zip 后，cd portfolio && bash deploy.sh
# 前置：已安装 GitHub CLI (gh) 并执行过 gh auth login

set -e
REPO="ai-portfolio"   # 仓库名，可改
cd "$(dirname "$0")"

echo "→ 创建 GitHub 仓库并推送..."
gh repo create "$REPO" --public --source=. --remote=origin --push --description "郑同学 AI 作品集：Prompt Engineering 实战 + Vibe Coding 小游戏"

echo "→ 开启 GitHub Pages..."
gh api "repos/zhengjinglei09-source/$REPO/pages" -X POST \
  -f source[branch]=main -f source[path]=/ >/dev/null 2>&1 || true

URL="https://zhengjinglei09-source.github.io/$REPO/"
echo ""
echo "✅ 部署完成！"
echo "📎 公开链接：$URL"
echo "（Pages 首次生效约需 1-2 分钟，刷新即可）"
